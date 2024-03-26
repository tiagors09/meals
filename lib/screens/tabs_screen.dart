import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const tabs = [
      Tab(
        icon: Icon(Icons.category),
        text: 'Categorias',
      ),
      Tab(
        icon: Icon(Icons.star),
        text: 'Favoritos',
      ),
    ];

    const screens = [
      CategoriesScreen(),
      FavoriteScreen(),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Vamos Cozinhar?'),
          bottom: const TabBar(tabs: tabs),
        ),
        body: const TabBarView(children: screens),
      ),
    );
  }
}
