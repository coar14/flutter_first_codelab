import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/my_app_state.dart';
import 'generator_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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

    return SafeArea(
      child: Scaffold(
        body: GeneratorPage(
          wordPair: wordPair, 
          appState: appState, 
          icon: icon),
      ),
    );
  }
}
