import 'package:flutter/material.dart';
import 'package:star_wars/http/star_wars_http.dart';
import 'package:star_wars/models/film.dart';
import 'package:star_wars/widgets/main_drawer.dart';

class FilmsScreen extends StatefulWidget {
  const FilmsScreen({Key? key}) : super(key: key);

  @override
  _FilmsScreenState createState() => _FilmsScreenState();
}

class _FilmsScreenState extends State<FilmsScreen> {
  final starWarsHttp = StarWarsHttp();
  List<Film> _films = [];

  Future<void> _loadFilms() async {
    final films = await starWarsHttp.getListOfFilms();
    setState(() {
      _films = films;
    });
  }

  @override
  void initState() {
    _loadFilms();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Filmes'),
      ),
      drawer: const MainDrawer(),
      body: _films.isNotEmpty ? Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 5,
        ),
        child: ListView.builder(
          itemCount: _films.length,
          itemBuilder: (_, index) => GestureDetector(
            onTap: (){
              print(_films[index].id);
            },
            child: Card(
              elevation: 5,
              child: ListTile(
                title: Text(_films[index].title),
                subtitle: Text(_films[index].director),
                trailing: const Icon(Icons.local_movies_outlined),
              ),
            ),
          ),
        ),
      ) : const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
