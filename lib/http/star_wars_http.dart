import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:star_wars/models/film.dart';
import 'package:star_wars/models/people.dart';
import 'package:star_wars/models/species.dart';
import 'package:star_wars/models/starship.dart';
import 'package:star_wars/models/vehicle.dart';

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
  
  Future<List<Film>> getListOfFilms() async {
    final String url = urlBase + "/films";
    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> filmsMap = body['results'];
    final List<Film> films = filmsMap
        .map((f) => Film.fromJson(f))
        .toList();

    return films;
  }
  
  Future<List<Starship>> getListOfStarships() async {
    final String url = urlBase + "/starships";
    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> starshipsMap = body['results'];
    final List<Starship> starships = starshipsMap
        .map((s) => Starship.fromJson(s))
        .toList();

    return starships;
  }
  
  Future<List<Vehicle>> getListOfVehicles() async {
    final String url = urlBase + "/vehicles";
    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> vehiclesMap = body['results'];
    final List<Vehicle> vehicles = vehiclesMap
        .map((s) => Vehicle.fromJson(s))
        .toList();

    return vehicles;
  }
  
  Future<List<Species>> getListOfSpecies() async {
    final String url = urlBase + "/species";
    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> speciesMap = body['results'];
    final List<Species> species = speciesMap
        .map((s) => Species.fromJson(s))
        .toList();

    return species;
  }
  
  Future<List<Film>> getListOfPlanets() async {
    final String url = urlBase + "/planets";
    final response = await http.get(Uri.parse(url));
    final Map<String, dynamic> body = jsonDecode(response.body);
    final List<dynamic> planetsMap = body['results'];
    final List<Film> planets = planetsMap
        .map((p) => Film.fromJson(p))
        .toList();

    return planets;
  }
}
