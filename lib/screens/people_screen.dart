import 'package:flutter/material.dart';
import 'package:star_wars/http/star_wars_http.dart';
import 'package:star_wars/models/people.dart';
import 'package:star_wars/widgets/main_drawer.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  _PeopleScreenState createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  final starWarsHttp = StarWarsHttp();
  List<People> _people = [];

  Future<void> _loadPeople() async {
    final people = await starWarsHttp.getListOfPeople();
    setState(() {
      _people = people;
    });
  }

  @override
  void initState() {
    _loadPeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Personagens'),
      ),
      drawer: const MainDrawer(),
      body: _people.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              child: ListView.builder(
                itemCount: _people.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    print(_people[index].name);
                  },
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(_people[index].name),
                      subtitle: Text(_people[index].birthYear),
                      trailing: const Icon(Icons.person_rounded),
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
