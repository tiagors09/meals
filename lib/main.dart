import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';

void main(List<String> args) {
  runApp(const Meals());
}

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar?',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const CategoriesScreen(),
    );
  }
}
