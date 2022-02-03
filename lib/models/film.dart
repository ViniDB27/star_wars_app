class Film {
  final String title;
  final int id;
  final String openingCrawl;
  final String director;
  final String producer;
  final String releaseDate;

  Film({
    required this.title,
    required this.id,
    required this.openingCrawl,
    required this.director,
    required this.producer,
    required this.releaseDate,
  });

  factory Film.fromJson(Map<String, dynamic> film) => Film(
        title: film['title'],
        id: film['id'],
        openingCrawl: film['opening_crawl'],
        director: film['director'],
        producer: film['producer'],
        releaseDate: film['releaseDate'],
      );
}
