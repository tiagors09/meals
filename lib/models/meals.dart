enum Complexity {
  simple('Simple'),
  medium('Medium'),
  difficult('Difficult');

  final String label;
  const Complexity(this.label);
}

enum Cost {
  cheap('Cheap'),
  fair('Fair'),
  expensive('Expensive');

  final String label;
  const Cost(this.label);
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isVegan;
  final bool isVegetarian;
  final bool isLactoseFree;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    required this.id,
    required this.categories,
    required this.title,
    required this.imageUrl,
    required this.ingredients,
    required this.steps,
    required this.duration,
    required this.isGlutenFree,
    required this.isVegan,
    required this.isVegetarian,
    required this.isLactoseFree,
    required this.complexity,
    required this.cost,
  });
}
