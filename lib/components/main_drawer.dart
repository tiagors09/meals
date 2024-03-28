import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  Widget _createItem(IconData icon, String label, Function onTap) => ListTile(
        onTap: () => onTap(),
        leading: Icon(
          icon,
          size: 26,
        ),
        title: Text(
          label,
          style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    final drawerItems = [
      _createItem(
        Icons.restaurant,
        'Refeições',
        () => Navigator.of(context).pushReplacementNamed(
          AppRoutes.home.name,
        ),
      ),
      _createItem(
        Icons.settings,
        'Configurações',
        () => Navigator.of(context).pushReplacementNamed(
          AppRoutes.settings.name,
        ),
      ),
    ];

    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).colorScheme.secondary,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          ...drawerItems,
        ],
      ),
    );
  }
}
