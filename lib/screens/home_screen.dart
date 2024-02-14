import 'package:flutter/material.dart';
import 'package:movies_app/providers/characters_provider.dart';
import 'package:movies_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final charactersProvider = Provider.of<CharactersProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rick & Morty\'s Wonderful Characters'),
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search_outlined))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // Targetes principals
              CardSwiper(characters: charactersProvider.characters),

              // Slider de personatges humans
              CharacterSlider(humans: charactersProvider.humans),

            ],
          ),
        ),
      ),
    );
  }
}
