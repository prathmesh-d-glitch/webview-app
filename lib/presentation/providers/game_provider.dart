import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:webview/models/game.dart';

// List of games as dummy data
final List<Game> _games = [  
  Game(
    title: 'Dragon Ball Sparking Zero',
    imageUrl: 'https://cdn.wccftech.com/wp-content/uploads/2024/05/dragon-ball-sparking-zero-release-date.jpg',
    description: 'An explosive fighting game that brings the Dragon Ball universe to life with intense battles, '
        'dynamic transformations, and iconic characters.',
  ),
  Game(
    title: 'Black Myth Wukong',
    imageUrl: 'https://nikopartners.com/wp-content/uploads/2024/10/Black-Myth-Wukong.png',
    description: 'Embark on a mythical adventure inspired by the Chinese classic Journey to the West. '
        'Face powerful foes and master the art of transformation as Wukong, the Monkey King.',
  ),
  Game(
    title: 'God of War',
    imageUrl: 'https://assets-prd.ignimgs.com/2023/02/28/gow-1-1677614907373.jpg',
    description: 'Experience the epic journey of Kratos and Atreus as they navigate Norse mythology, '
        'facing fierce enemies and uncovering secrets of the gods.',
  ),
  Game(
    title: 'Dragon Ball Sparking Zero',
    imageUrl: 'https://cdn.wccftech.com/wp-content/uploads/2024/05/dragon-ball-sparking-zero-release-date.jpg',
    description: 'An explosive fighting game that brings the Dragon Ball universe to life with intense battles, '
        'dynamic transformations, and iconic characters.',
  ),
  Game(
    title: 'Black Myth Wukong',
    imageUrl: 'https://nikopartners.com/wp-content/uploads/2024/10/Black-Myth-Wukong.png',
    description: 'Embark on a mythical adventure inspired by the Chinese classic Journey to the West. '
        'Face powerful foes and master the art of transformation as Wukong, the Monkey King.',
  ),
  Game(
    title: 'God of War',
    imageUrl: 'https://assets-prd.ignimgs.com/2023/02/28/gow-1-1677614907373.jpg',
    description: 'Experience the epic journey of Kratos and Atreus as they navigate Norse mythology, '
        'facing fierce enemies and uncovering secrets of the gods.',
  ),
];

// Riverpod provider for accessing games
final gameProvider = Provider<List<Game>>((ref) {
  return _games;
});
