import 'package:flutter/material.dart';
import '../models/personality.dart';
import '../screens/detail_screen.dart';

class PersonalityTile extends StatelessWidget {
  final Personality personality;

  const PersonalityTile({super.key, required this.personality});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(personality.imageUrl),
        radius: 25,
      ),
      title: Text(personality.name),
      //subtitle: Text(personality.description),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(personality: personality),
          ),
        );
      },
    );
  }
}