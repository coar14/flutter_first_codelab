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
        body: Column(
          children: [
            const Text('A random idea'),
            BigCard(wordPair: wordPair),
            ElevatedButton(
              onPressed: () => appState.getNext(),
              child: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
