import 'package:flutter/material.dart';
import 'screens/list_screen.dart';

void main() => runApp(const DogMatchApp());

class DogMatchApp extends StatelessWidget {
  const DogMatchApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DogMatch',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const ListScreen(),
    );
  }
}