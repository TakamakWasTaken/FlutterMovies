import 'genreModel.dart';

class Movie {
  final String title;
  final int id;
  final String imageUrl;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  List<Genre> genreList = [];
  final int voteCount;

  Movie(
      {this.title,
      this.id,
      this.imageUrl,
      this.releaseDate,
      this.overview,
      this.voteAverage,
      this.voteCount,
      this.genreList});

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    List<Genre> tmpGenreList = [];
    if (parsedJson["genres"] != null) {
      var jsonGenreList = parsedJson["genres"];
      for (int i = 0; i < jsonGenreList.length; i++) {
        tmpGenreList.add(Genre.fromJson(jsonGenreList[i]));
      }
    }
    return Movie(
        title: parsedJson['title'],
        id: parsedJson['id'],
        releaseDate: parsedJson['release_date'],
        overview: parsedJson['overview'],
        voteAverage: parsedJson['vote_average'],
        voteCount: parsedJson['vote_count'],
        genreList: tmpGenreList,
        imageUrl:
            "https://image.tmdb.org/t/p/w500" + parsedJson['poster_path']);
  }
}
