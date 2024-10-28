import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:webview/presentation/screens/home_screen.dart';
import 'package:webview/presentation/screens/select_game_page.dart';
import 'package:webview/presentation/screens/webview_screen.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;
  bool _isCollapsed = false;
  final PageController _pageController = PageController();

  final List<IconData> _icons = [
    Icons.home,
    Icons.games_outlined,
    Icons.list,
    Icons.shopping_cart,
    Icons.chat,
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [
      const HomeScreen(),
      const WebViewScreen(),
      SelectGamePage(),
      const Center(child: Text('Cart Page')),
      const Center(child: Text('Chat Page')),
    ];
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _selectedIndex = index;
                _isCollapsed = false;
              });
            },
            children: pages,
          ),
          Positioned(
            top: screenHeight * 0.9,
            left: screenWidth * 0.055,
            child: _buildTabBar(screenWidth),
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(double screenWidth) {
    return IgnorePointer(
      ignoring: false,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: _isCollapsed ? 70 : screenWidth * 0.9,
        height: 70,
        decoration: const BoxDecoration(
          color: Color.fromRGBO(51, 51, 51, 0.84),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, 0.25),
              offset: Offset(0, 4),
              blurRadius: 4,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(
                _isCollapsed ? 1 : _icons.length,
                (index) {
                  final tabIndex = _isCollapsed ? _selectedIndex : index;
                  final isSelected = _selectedIndex == tabIndex;

                  return GestureDetector(
                    onTap: () => _onTabSelected(tabIndex),
                    onDoubleTap: () {
                      setState(() {
                        _isCollapsed = !_isCollapsed;
                      });
                    },
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: (_isCollapsed && index != _selectedIndex) ? 0 : 1,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color.fromRGBO(45, 45, 45, 1)
                                  : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected
                                    ? const Color.fromRGBO(94, 94, 94, 1)
                                    : Colors.transparent,
                                width: 1,
                              ),
                            ),
                            padding: const EdgeInsets.all(8),
                            child: Icon(
                              _icons[tabIndex],
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onTabSelected(int index) {
    setState(() {
      if (_selectedIndex == index && !_isCollapsed) {
        _isCollapsed = true;
      } else {
        _selectedIndex = index;
        _isCollapsed = false;
      }
    });
    _pageController.jumpToPage(index);
  }
}
