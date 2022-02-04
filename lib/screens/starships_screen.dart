import 'package:flutter/material.dart';
import 'package:star_wars/http/star_wars_http.dart';
import 'package:star_wars/models/starship.dart';
import 'package:star_wars/widgets/main_drawer.dart';

class StarshipScreen extends StatefulWidget {
  const StarshipScreen({Key? key}) : super(key: key);

  @override
  _StarshipScreenState createState() => _StarshipScreenState();
}

class _StarshipScreenState extends State<StarshipScreen> {
  final starWarsHttp = StarWarsHttp();
  List<Starship> _starship = [];

  Future<void> _loadStarships() async {
    final starship = await starWarsHttp.getListOfStarships();
    setState(() {
      _starship = starship;
    });
  }

  @override
  void initState() {
    _loadStarships();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Naves'),
      ),
      drawer: const MainDrawer(),
      body: _starship.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              child: ListView.builder(
                itemCount: _starship.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    print(_starship[index].name);
                  },
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(_starship[index].name),
                      subtitle: Text(_starship[index].model),
                      trailing: const Icon(Icons.airplanemode_active),
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
