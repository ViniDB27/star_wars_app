class Starship {
  final String name;
  final String model;
  final String manufacturer;
  final String costInCredits;
  final String length;
  final String maxAtmospheringSpeed;
  final String crew;
  final String passengers;
  final String cargoCapacity;
  final String consumables;
  final String hyperdriveRating;
  final String mglt;
  final String starshipClass;

  Starship({
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
    required this.hyperdriveRating,
    required this.mglt,
    required this.starshipClass,
  });

  factory Starship.fromJson(Map<String, dynamic> starship) => Starship(
        name: starship['name'],
        model: starship['model'],
        manufacturer: starship['manufacturer'],
        costInCredits: starship['cost_in_credits'],
        length: starship['length'],
        maxAtmospheringSpeed: starship['max_atmosphering_speed'],
        crew: starship['crew'],
        passengers: starship['passengers'],
        cargoCapacity: starship['cargo_capacity'],
        consumables: starship['consumables'],
        hyperdriveRating: starship['hyperdrive_rating'],
        mglt: starship['MGLT'],
        starshipClass: starship['starship_class'],
      );
}
