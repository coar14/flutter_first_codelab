import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/my_app_state.dart';
import '../widgets/big_card.dart';

class GeneratorPage extends StatelessWidget {
  const GeneratorPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var wordPair = appState.current;

    IconData icon;
    if (appState.favorites.contains(wordPair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

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
