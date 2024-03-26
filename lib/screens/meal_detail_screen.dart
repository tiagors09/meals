import 'package:flutter/material.dart';
import 'package:meals/models/meals.dart';

class MealDetailScreen extends StatelessWidget {
  const MealDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context)?.settings.arguments as Meal;

    var ingredientsList = ListView.builder(
      itemCount: meal.ingredients.length,
      itemBuilder: (ctx, index) {
        return Card(
          color: Theme.of(context).colorScheme.secondary,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10,
            ),
            child: Text(meal.ingredients[index]),
          ),
        );
      },
    );

    var stepsList = ListView.builder(
      itemCount: meal.steps.length,
      itemBuilder: (ctx, index) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Text('${index + 1}'),
              ),
              title: Text(meal.steps[index]),
            ),
            const Divider(),
          ],
        );
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 300,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(
              context,
              'Ingredientes',
            ),
            _createSectionContainer(
              context,
              ingredientsList,
            ),
            _createSectionTitle(context, 'Passos'),
            _createSectionContainer(
              context,
              stepsList,
            ),
          ],
        ),
      ),
    );
  }

  Container _createSectionContainer(BuildContext context, Widget child) {
    return Container(
      width: 300,
      height: 250,
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Container _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge,
      ),
    );
  }
}
