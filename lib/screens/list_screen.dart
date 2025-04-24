import 'package:flutter/material.dart';
import '../models/personality.dart';
import '../widgets/personality_tile.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Choose your personality')),
      body: ListView.builder(
        itemCount: personalities.length,
        itemBuilder: (context, index) {
          return PersonalityTile(personality: personalities[index]);
        },
      ),
    );
  }
}

