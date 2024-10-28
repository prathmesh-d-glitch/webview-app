import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview/widgets/card_widget.dart';
import 'package:webview/presentation/providers/game_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen>
    with SingleTickerProviderStateMixin {
  double progress = 0.0;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween<double>(begin: 0.0, end: 0.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void updateProgress(double newProgress) {
    setState(() {
      _animation =
          Tween<double>(begin: progress, end: newProgress).animate(_controller);
      _controller.forward(from: 0.0);
      progress = newProgress;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Access the games list from the provider
    final games = ref.watch(gameProvider);

    return Scaffold(
      backgroundColor: Colors.grey[100], // Subtle background color for elegance
      appBar: AppBar(
        title:
            const Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        bottom: PreferredSize(                      // Smooth Progress Bar Widget
          preferredSize: const Size.fromHeight(4.0),
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  color: const Color.fromARGB(255, 118, 59, 255),
                  height: 4.0,
                  width: MediaQuery.of(context).size.width * _animation.value,
                ),
              );
            },
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification.metrics.maxScrollExtent > 0) {
                  double newProgress = scrollNotification.metrics.pixels /
                      scrollNotification.metrics.maxScrollExtent;
                  updateProgress(newProgress);
                }
                return true;
              },
              child: ListView.builder(
                itemCount: games.length + 1, // Dynamically set the number of items
                itemBuilder: (context, index) {                  
                  if (index < games.length) {
                    final game = games[index];
                    return CardWidget(
                      game: game,
                    );
                  } else {
                    return const SizedBox(
                      height:
                          100, // Adjust the height of the empty card as needed
                      child: Center(
                        child: Text(
                          'This is an empty card at the bottom',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
