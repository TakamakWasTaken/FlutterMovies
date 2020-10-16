import 'dart:convert';
import 'dart:ffi';

import 'package:MagicSystem/models/genreModel.dart';

class TvShow {
  final String title;
  final int id;
  final String imageUrl;
  final String releaseDate;
  final String overview;
  final double voteAverage;
  List<Genre> genreList = [];
  int voteCount;

  TvShow(
      {this.title,
      this.id,
      this.imageUrl,
      this.releaseDate,
      this.overview,
      this.voteAverage,
      this.voteCount,
      this.genreList});

  factory TvShow.fromJson(Map<String, dynamic> parsedJson) {
    List<Genre> tmpGenreList = [];
    if (parsedJson["genres"] != null) {
      var jsonGenreList = parsedJson["genres"];
      for (int i = 0; i < jsonGenreList.length; i++) {
        tmpGenreList.add(Genre.fromJson(jsonGenreList[i]));
      }
    }
    return TvShow(
        title: parsedJson['name'],
        id: parsedJson['id'],
        releaseDate: parsedJson['first_air_date'],
        overview: parsedJson['overview'],
        voteAverage: parsedJson['vote_average'],
        voteCount: parsedJson['vote_count'],
        genreList: tmpGenreList,
        imageUrl:
            "https://image.tmdb.org/t/p/w500" + parsedJson['poster_path']);
  }
}
