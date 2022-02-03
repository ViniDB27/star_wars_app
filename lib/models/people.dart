class People {
  final String name;
  final String height;
  final String mass;
  final String hairColor;
  final String skinColor;
  final String eyeColor;
  final String birthYear;
  final String gender;
  final String homeworld;

  People({
    required this.name,
    required this.height,
    required this.mass,
    required this.hairColor,
    required this.skinColor,
    required this.eyeColor,
    required this.birthYear,
    required this.gender,
    required this.homeworld,
  });

  factory People.fromJson(Map<String, dynamic> people) => People(
        name: people['name'],
        height: people['height'],
        mass: people['mass']!,
        hairColor: people['hair_color'],
        skinColor: people['skin_color'],
        eyeColor: people['eye_color'],
        birthYear: people['birth_year'],
        gender: people['gender'],
        homeworld: people['homeworld'],
      );
}
