import 'package:flutter/material.dart';
import 'package:meals/components/meal_item.dart';
import '../models/meal.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoriteScreen({
    super.key,
    required this.favoriteMeals,
  });

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('Minhas refeições favoritas'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) => MealItem(
          meal: favoriteMeals[index],
        ),
        itemCount: favoriteMeals.length,
      );
    }
  }
}
