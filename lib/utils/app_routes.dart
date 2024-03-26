enum AppRoutes {
  home('/'),
  categoriesMeals('/categories-meals'),
  mealDetail('/meal-detail');

  const AppRoutes(this.name);

  final String name;
}
