import 'package:flutter/material.dart';
import 'package:star_wars/http/star_wars_http.dart';
import 'package:star_wars/models/species.dart';
import 'package:star_wars/models/vehicle.dart';
import 'package:star_wars/widgets/main_drawer.dart';

class SpeciesScreen extends StatefulWidget {
  const SpeciesScreen({Key? key}) : super(key: key);

  @override
  _SpeciesScreenState createState() => _SpeciesScreenState();
}

class _SpeciesScreenState extends State<SpeciesScreen> {
  final starWarsHttp = StarWarsHttp();
  List<Species> _species = [];

  Future<void> _loadSpecies() async {
    final species = await starWarsHttp.getListOfSpecies();
    setState(() {
      _species = species;
    });
  }

  @override
  void initState() {
    _loadSpecies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Veiculos'),
      ),
      drawer: const MainDrawer(),
      body: _species.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              child: ListView.builder(
                itemCount: _species.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    print(_species[index].name);
                  },
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(_species[index].name),
                      subtitle: Text(_species[index].language),
                      trailing: const Icon(Icons.android),
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
