import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'routes/app_router.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gaming WebView App',
      routerConfig: appRouter, // Use `routerConfig` instead of separate delegate/parser
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
