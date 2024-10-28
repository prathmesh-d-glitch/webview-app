import 'package:flutter_riverpod/flutter_riverpod.dart';

final webViewStateProvider = StateProvider<bool>((ref) => false);
final connectivityProvider = FutureProvider<bool>((ref) async {
  // Implement connectivity check logic here
  return true;
});
