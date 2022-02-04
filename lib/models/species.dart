class Species {
  final String name;
  final String averageHeight;
  final String averageLifespan;
  final String classification;
  final String designation;
  final String eyeColor;
  final String hairColor;
  final String language;
  final String skinColor;

  Species({
    required this.name,
    required this.averageHeight,
    required this.averageLifespan,
    required this.classification,
    required this.designation,
    required this.eyeColor,
    required this.hairColor,
    required this.language,
    required this.skinColor,
  });

  factory Species.fromJson(Map<String, dynamic> specie) => Species(
        name: specie['name'],
        averageHeight: specie['average_height'],
        averageLifespan: specie['average_lifespan'],
        classification: specie['classification'],
        designation: specie['designation'],
        language: specie['language'],
        eyeColor: specie['eye_colors'],
        hairColor: specie['hair_colors'],
        skinColor: specie['skin_colors'],
      );
}
