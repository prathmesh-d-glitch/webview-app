import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview/presentation/providers/game_link_provider.dart';

// Define a simple page to select the game server
class SelectGamePage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the list of game links
    final gameLinks = ref.watch(gameLinksProvider);
    // Watch the currently active game link
    final selectedLinkIndex = ref.watch(selectedLinkIndexProvider);
    final selectedLink = ref.watch(gameLinkProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Game Server'),
      ),
      body: ListView.builder(
        itemCount: gameLinks.length,
        itemBuilder: (context, index) {
          final link = gameLinks[index];
          final isSelected = selectedLink == link;

          return ListTile(
            title: Text('Server ${index + 1}'),
            subtitle: Text(link),
            trailing: isSelected
                ? Icon(Icons.check_circle, color: Colors.green)
                : null,
            onTap: () {
              // Update the selected link index using the `selectGameLink` function
              selectGameLink(ref, index);
            },
          );
        },
      ),
    );
  }
}
