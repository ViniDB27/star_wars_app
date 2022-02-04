class Planet {
  final String name;
  final String climate;
  final String diameter;
  final String gravity;
  final String orbitalPeriod;
  final String population;
  final String rotationPeriod;
  final String surfaceWater;
  final String terrain;

  Planet({
    required this.name,
    required this.climate,
    required this.diameter,
    required this.gravity,
    required this.orbitalPeriod,
    required this.population,
    required this.rotationPeriod,
    required this.surfaceWater,
    required this.terrain,
  });

  factory Planet.fromJson(Map<String, dynamic> planet) => Planet(
        name: planet['name'],
        climate: planet['climate'],
        diameter: planet['diameter'],
        gravity: planet['gravity'],
        orbitalPeriod: planet['orbital_period'],
        population: planet['population'],
        rotationPeriod: planet['rotation_period'],
        surfaceWater: planet['surface_water'],
        terrain: planet['terrain'],
      );
}
