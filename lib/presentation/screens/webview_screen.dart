import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview/presentation/providers/game_link_provider.dart';
import 'package:webview/widgets/error_display_widget.dart';
import 'package:webview/widgets/loading_progress_indicator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class WebViewScreen extends ConsumerStatefulWidget {
  const WebViewScreen({Key? key}) : super(key: key);

  @override
  _WebViewScreenState createState() => _WebViewScreenState();
}

class _WebViewScreenState extends ConsumerState<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _hasError = false;
  String _errorMessage = '';
  int _loadingProgress = 0;
  Timer? _refreshDebouncer;

  @override
  void initState() {
    super.initState();
    _initializeWebView();
  }

  @override
  void dispose() {
    _refreshDebouncer?.cancel();
    super.dispose();
  }

  void _initializeWebView() {
    // Get the game link from the provider
    final initialUrl = ref.read(gameLinkProvider);

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..enableZoom(true)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isLoading = true;
              _hasError = false;
              _loadingProgress = 0;
            });
          },
          onProgress: (int progress) {
            setState(() {
              _loadingProgress = progress;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              _isLoading = false;
            });
            _injectPerformanceOptimizations();
          },
          onWebResourceError: (WebResourceError error) {
            setState(() {
              _hasError = true;
              _errorMessage = _getErrorMessage(error.errorCode);
              _isLoading = false;
            });
          },
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(initialUrl));
  }

  Future<void> _injectPerformanceOptimizations() async {
    await _controller.runJavaScript('''
      document.addEventListener('touchstart', function(event) {
        event.preventDefault();
      }, {passive: true});
      document.documentElement.style.webkitUserSelect = 'none';
      document.documentElement.style.scrollBehavior = 'smooth';
    ''');
  }

  String _getErrorMessage(int errorCode) {
    switch (errorCode) {
      case -2:
        return 'Failed to connect to the server.\nPlease check your internet connection.';
      case -6:
        return 'Connection timed out.\nPlease try again.';
      case -8:
        return 'Failed to load the page.\nPlease check the URL or try again.';
      default:
        return 'Something went wrong.\nPlease try again.';
    }
  }

  Future<void> _refreshWebView() async {
    _refreshDebouncer?.cancel();
    _refreshDebouncer = Timer(const Duration(milliseconds: 300), () async {
      try {
        setState(() {
          _hasError = false;
          _errorMessage = '';
        });
        await _controller.reload();
      } catch (e) {
        setState(() {
          _hasError = true;
          _errorMessage = 'Failed to refresh the page.\nPlease try again.';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            if (_isLoading && !_hasError)
              LoadingProgressIndicator(progress: _loadingProgress),
            Expanded(
              child: Stack(
                children: [
                  if (!_hasError)
                    RefreshIndicator(
                      onRefresh: _refreshWebView,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height -
                              MediaQuery.of(context).padding.top -
                              MediaQuery.of(context).padding.bottom,
                          child: WebViewWidget(
                            controller: _controller,
                          ),
                        ),
                      ),
                    ),
                  if (_hasError)
                    ErrorDisplayWidget(
                      message: _errorMessage,
                      onRetry: _refreshWebView,
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
