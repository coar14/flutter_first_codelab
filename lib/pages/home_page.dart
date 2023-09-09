import 'package:flutter/material.dart';

import 'favorites_page.dart';
import 'generator_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selectedRailIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget selectedPage = switch (selectedRailIndex) {
      0 => const GeneratorPage(),
      1 => const FavoritesPage(),
      _ => throw UnimplementedError('No page for index $selectedRailIndex'),
    };

    return Scaffold(
      body: Row(
        children: [
          NavigationRail(
            extended: false,
            destinations: const [
              NavigationRailDestination(
                icon: Icon(Icons.home),
                label: Text('Home'),
              ),
              NavigationRailDestination(
                icon: Icon(Icons.favorite),
                label: Text('Favorites'),
              ),
            ],
            selectedIndex: selectedRailIndex,
            onDestinationSelected: (int index) {
              setState(() {
                selectedRailIndex = index;
              });
            },
          ),
          Expanded(
            child: Container(
              color: Theme.of(context).colorScheme.primaryContainer,
              child: selectedPage,
            ),
          ),
        ],
      ),
    );
  }
}
