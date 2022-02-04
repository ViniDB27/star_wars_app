import 'package:flutter/material.dart';
import 'package:star_wars/http/star_wars_http.dart';
import 'package:star_wars/models/planet.dart';
import 'package:star_wars/models/vehicle.dart';
import 'package:star_wars/widgets/main_drawer.dart';

class PlanetsScreen extends StatefulWidget {
  const PlanetsScreen({Key? key}) : super(key: key);

  @override
  _PlanetsScreenState createState() => _PlanetsScreenState();
}

class _PlanetsScreenState extends State<PlanetsScreen> {
  final starWarsHttp = StarWarsHttp();
  List<Planet> _planets = [];

  Future<void> _loadPlanets() async {
    final planets = await starWarsHttp.getListOfPlanets();
    setState(() {
      _planets = planets;
    });
  }

  @override
  void initState() {
    _loadPlanets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Planetas'),
      ),
      drawer: const MainDrawer(),
      body: _planets.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              child: ListView.builder(
                itemCount: _planets.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    print(_planets[index].name);
                  },
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(_planets[index].name),
                      subtitle: Text(_planets[index].terrain),
                      trailing: const Icon(Icons.circle),
                    ),
                  ),
                ),
              ),
            )
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
