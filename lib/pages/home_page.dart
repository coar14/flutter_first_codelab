import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/my_app_state.dart';
import '../widgets/big_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var wordPair = appState.current;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BigCard(wordPair: wordPair),
              const SizedBox(height: 10),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                    onPressed: () => debugPrint('like button pressed'),
                    icon: const Icon(Icons.favorite),
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
        ),
      ),
    );
  }
}
