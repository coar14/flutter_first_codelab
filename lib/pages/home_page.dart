import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../states/my_app_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Text('A random idea'),
            Text(appState.current.asUpperCase)
          ],
        ),
      ),
    );
  }
}
