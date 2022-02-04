import 'package:flutter/material.dart';
import 'package:star_wars/http/star_wars_http.dart';
import 'package:star_wars/models/vehicle.dart';
import 'package:star_wars/widgets/main_drawer.dart';

class VehicleScreen extends StatefulWidget {
  const VehicleScreen({Key? key}) : super(key: key);

  @override
  _VehicleScreenState createState() => _VehicleScreenState();
}

class _VehicleScreenState extends State<VehicleScreen> {
  final starWarsHttp = StarWarsHttp();
  List<Vehicle> _vehicle = [];

  Future<void> _loadVehicles() async {
    final vehicle = await starWarsHttp.getListOfVehicles();
    setState(() {
      _vehicle = vehicle;
    });
  }

  @override
  void initState() {
    _loadVehicles();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Veiculos'),
      ),
      drawer: const MainDrawer(),
      body: _vehicle.isNotEmpty
          ? Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 5,
              ),
              child: ListView.builder(
                itemCount: _vehicle.length,
                itemBuilder: (_, index) => GestureDetector(
                  onTap: () {
                    print(_vehicle[index].name);
                  },
                  child: Card(
                    elevation: 5,
                    child: ListTile(
                      title: Text(_vehicle[index].name),
                      subtitle: Text(_vehicle[index].model),
                      trailing: const Icon(Icons.car_repair),
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
