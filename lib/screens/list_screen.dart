import 'package:flutter/material.dart';
import '../models/personality.dart';
import '../widgets/personality_tile.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Elige tu personalidad')),
      body: ListView.builder(
        itemCount: personalities.length,
        itemBuilder: (context, index) {
          return PersonalityTile(personality: personalities[index]);
        },
      ),
    );
  }
}

// En vez de ver las personalidades sin mas, esta pantalla será responsable de cargar las personalidades 
// y mostrarlas, personality tile sigue igual