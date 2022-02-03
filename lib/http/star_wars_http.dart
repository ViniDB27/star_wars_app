import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_wars/models/people.dart';

class StarWarsHttp {
  final String urlBase = "https://swapi.dev/api";

  Future<List<People>> getListOfPeople() async {
    final String url = urlBase + "/people";
    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> peopleMap = body['results'];
    final List<People> peopleArray = peopleMap
        .map((p) => People.fromJson(p))
        .toList();

    return peopleArray;
  }
}
