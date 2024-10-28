import 'package:flutter_riverpod/flutter_riverpod.dart';

// Define a list of game links
final gameLinksProvider = Provider<List<String>>((ref) {
  return [
    'https://github.com/prathmesh-d-glitch',
    'https://www.linkedin.com/in/prathmesh-dubey-92b3252b7/',
    'https://leetcode.com/u/prathmesh-d/',
  ];
});

// Define a StateProvider to hold the index of the selected game link
final selectedLinkIndexProvider = StateProvider<int>((ref) => 0);

// Define a provider that returns the currently selected game link based on the selected index
final gameLinkProvider = Provider<String>((ref) {
  final links = ref.watch(gameLinksProvider);
  final selectedIndex = ref.watch(selectedLinkIndexProvider);
  return links[selectedIndex];
});

// Function to update the selected game link index
void selectGameLink(WidgetRef ref, int index) {
  ref.read(selectedLinkIndexProvider.notifier).state = index;
}
