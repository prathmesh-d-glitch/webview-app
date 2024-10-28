// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:webview/widgets/custom_tab_bar.dart';
// import '../presentation/screens/home_screen.dart';
import '../presentation/screens/webview_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const CustomTabBar(),
    ),
    GoRoute(
      path: '/webview',
      builder: (context, state) => WebViewScreen(),
    ),
  ],
);
