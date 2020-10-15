class Movie {
  final String title;
  final int id;
  final String imageUrl;
  final String releaseDate;

  Movie({this.releaseDate, this.title, this.id, this.imageUrl});

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
        title: parsedJson['title'],
        id: parsedJson['id'],
        releaseDate: parsedJson['release_date'],
        imageUrl:
            "https://image.tmdb.org/t/p/w500" + parsedJson['poster_path']);
  }
}
