// Progress Indicator Widget
import 'package:flutter/material.dart';

class LoadingProgressIndicator extends StatelessWidget {
  final int progress;

  const LoadingProgressIndicator({
    Key? key,
    required this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: progress / 100,
      backgroundColor: Colors.grey[200],
      valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
    );
  }
}