import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/utils/app_routes.dart';

void main(List<String> args) {
  runApp(const Meals());
}

class Meals extends StatelessWidget {
  const Meals({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    return MaterialApp(
      initialRoute: AppRoutes.home.name,
      routes: {
        AppRoutes.home.name: (ctx) => const CategoriesScreen(),
        AppRoutes.categoriesMeals.name: (ctx) => const CategoriesMealsScreen(),
      },
      title: 'Vamos Cozinhar?',
      theme: theme.copyWith(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.pink,
          secondary: Colors.amber,
        ),
      ),
    );
  }
}
