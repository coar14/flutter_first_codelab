import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/my_app_state.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    if (appState.favorites.isEmpty) {
      return const Center(
        child: Text('No favorite wordpair yet.',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            )),
      );
    }
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'You have ${appState.favorites.length} favorites.',
            style: const TextStyle(fontSize: 24),
          ),
        ),
        //how to convert favorites item into a list? by array
        for (var pair in appState.favorites)
          ListTile(
            title: Text(pair.asPascalCase),
            leading: const Icon(Icons.favorite),
          ),
      ],
    );
  }
}
