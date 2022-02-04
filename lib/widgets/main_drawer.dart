import 'package:flutter/material.dart';
import 'package:star_wars/routes/app_routes.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({ Key? key }) : super(key: key);

  Widget _createitem(IconData icon, String label, Function onTap) {
    return ListTile(
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
      onTap: () => onTap(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            color: Theme.of(context).accentColor,
            alignment: Alignment.bottomRight,
            child: Text(
              'Vamos Cozinhar?',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _createitem(
            Icons.person_rounded,
            'Personagens',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.listPeople),
          ),
          _createitem(
            Icons.local_movies_outlined,
            'Filmes',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.listFilms),
          ),
          _createitem(
            Icons.airplanemode_active,
            'Naves',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.listStarships),
          ),
          _createitem(
            Icons.car_repair,
            'Veiculos',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.listVehicles),
          ),
          _createitem(
            Icons.android,
            'Especies',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.listSpecies),
          ),
          _createitem(
            Icons.circle,
            'Planetas',
            () => Navigator.of(context).pushReplacementNamed(AppRoutes.listFilms),
          ),
        ],
      ),
    );
  }
}