class Vehicle {
  final String name;
  final String model;
  final String cargoCapacity;
  final String consumables;
  final String costInCredits;
  final String manufacturer;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String vehicleClass;

  Vehicle({
    required this.vehicleClass,
    required this.name,
    required this.model,
    required this.manufacturer,
    required this.costInCredits,
    required this.length,
    required this.maxAtmospheringSpeed,
    required this.crew,
    required this.passengers,
    required this.cargoCapacity,
    required this.consumables,
  });

  factory Vehicle.fromJson(Map<String, dynamic> vehicle) => Vehicle(
        name: vehicle['name'],
        model: vehicle['model'],
        manufacturer: vehicle['manufacturer'],
        costInCredits: vehicle['cost_in_credits'],
        length: vehicle['length'],
        maxAtmospheringSpeed: vehicle['max_atmosphering_speed'],
        crew: vehicle['crew'],
        passengers: vehicle['passengers'],
        cargoCapacity: vehicle['cargo_capacity'],
        consumables: vehicle['consumables'],
        vehicleClass: vehicle['vehicle_class']
      );
}
