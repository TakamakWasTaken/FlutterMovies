import 'dart:ffi';

class Movie {
  final String title;
  final int id;
  final String imageUrl;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  final int voteCount;

  Movie(
      {this.title,
      this.id,
      this.imageUrl,
      this.releaseDate,
      this.overview,
      this.voteAverage,
      this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
        title: parsedJson['title'],
        id: parsedJson['id'],
        releaseDate: parsedJson['release_date'],
        overview: parsedJson['overview'],
        voteAverage: parsedJson['vote_average'],
        voteCount: parsedJson['vote_count'],
        imageUrl:
            "https://image.tmdb.org/t/p/w500" + parsedJson['poster_path']);
  }
}
