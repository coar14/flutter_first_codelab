import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

import '../states/my_app_state.dart';
import '../widgets/big_card.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({
    super.key,
    required this.wordPair,
    required this.appState,
    required this.icon,
  });

  final WordPair wordPair;
  final MyAppState appState;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BigCard(wordPair: wordPair),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton.icon(
                onPressed: () => appState.toggleFavorite(),
                icon: Icon(icon),
                label: const Text('Like'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => appState.getNext(),
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
