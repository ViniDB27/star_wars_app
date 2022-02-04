import 'package:flutter/material.dart';
import 'package:star_wars/routes/app_routes.dart';
import 'package:star_wars/screens/films_screen.dart';
import 'package:star_wars/screens/people_screen.dart';
import 'package:star_wars/screens/planets_screen.dart';
import 'package:star_wars/screens/species_screen.dart';
import 'package:star_wars/screens/starships_screen.dart';
import 'package:star_wars/screens/vehicles_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Wars',
      theme: ThemeData(
        primaryColor: Colors.indigo,
        primarySwatch: Colors.indigo,
      ),
      initialRoute: AppRoutes.listPeople,
      routes: {
        AppRoutes.listFilms: (ctx) => const FilmsScreen(),
        AppRoutes.listPeople: (ctx) => const PeopleScreen(),
        AppRoutes.listStarships: (ctx) => const StarshipScreen(),
        AppRoutes.listVehicles: (ctx) => const VehicleScreen(),
        AppRoutes.listSpecies: (ctx) => const SpeciesScreen(),
        AppRoutes.listPlanets: (ctx) => const PlanetsScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
