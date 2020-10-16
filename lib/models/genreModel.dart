class Genre {
  final int id;
  final String name;

  Genre({this.id, this.name});

  factory Genre.fromJson(Map<String, dynamic> parsedJson) {
    return Genre(name: parsedJson['name'], id: parsedJson['id']);
  }
}
