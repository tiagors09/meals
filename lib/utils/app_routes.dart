enum AppRoutes {
  home('/'),
  categoriesMeals('/categories-meals'),
  mealDetail('/meal-detail'),
  settings('/settings');

  const AppRoutes(this.name);

  final String name;
}
