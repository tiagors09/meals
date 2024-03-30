import 'package:flutter/material.dart';
import 'package:meals/screens/categories_meals_screen.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/data/dummy_data.dart';

import 'models/settings.dart';

void main(List<String> args) {
  runApp(const Meals());
}

class Meals extends StatefulWidget {
  const Meals({super.key});

  @override
  State<Meals> createState() => _MealsState();
}

class _MealsState extends State<Meals> {
  var settings = Settings();
  List<Meal> _availableMeals = dummyMeals;
  final List<Meal> _favoriteMeals = [];

  _filterMeals(Settings settings) {
    setState(() {
      this.settings = settings;

      _availableMeals = dummyMeals.where((meal) {
        final filterGlutten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;

        return !filterGlutten &&
            !filterGlutten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  _toggleFavorite(Meal meal) {
    setState(() {
      _favoriteMeals.contains(meal)
          ? _favoriteMeals.remove(meal)
          : _favoriteMeals.add(meal);
    });
  }

  bool _isFavorite(Meal meal) => _favoriteMeals.contains(meal);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();

    var routes = {
      AppRoutes.home.name: (ctx) => TabsScreen(
            favoriteMeals: _favoriteMeals,
          ),
      AppRoutes.categoriesMeals.name: (ctx) => CategoriesMealsScreen(
            meals: _availableMeals,
          ),
      AppRoutes.mealDetail.name: (ctx) => MealDetailScreen(
            isFavorite: _isFavorite,
            onTogggleFavorite: _toggleFavorite,
          ),
      AppRoutes.settings.name: (ctx) => SettingsScreen(
            onSettingsChanged: _filterMeals,
            settings: settings,
          ),
    };

    return MaterialApp(
      initialRoute: AppRoutes.home.name,
      routes: routes,
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
