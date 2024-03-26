import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
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
        AppRoutes.home.name: (ctx) => const TabsScreen(),
        AppRoutes.categoriesMeals.name: (ctx) => const CategoriesMealsScreen(),
        AppRoutes.mealDetail.name: (ctx) => const MealDetailScreen(),
      },
      title: 'Vamos Cozinhar?',
      theme: theme.copyWith(
        canvasColor: const Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                color: Colors.black,
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
