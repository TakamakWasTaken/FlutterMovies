import 'dart:convert';

import 'package:MagicSystem/models/genreModel.dart';
import 'package:MagicSystem/models/movieModel.dart';
import 'package:MagicSystem/models/tvShowModel.dart';
import 'package:http/http.dart' as http;

class Testrepo {
  static Future<List<Movie>> weeklyPopularMovies() async {
    String url =
        "https://api.themoviedb.org/3/trending/movie/week?api_key=62feaff3d2cf094a340f530fbf25bde9";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResults = jsonDecode(response.body)["results"];
      List<Movie> jsonMovieList = [];

      for (int i = 0; i < jsonResults.length; i++) {
        jsonMovieList.add(Movie.fromJson(jsonResults[i]));
      }
      return jsonMovieList;
    } else {
      return null;
    }
  }

  static Future<List<TvShow>> weeklyPopularTvShows() async {
    String url =
        "https://api.themoviedb.org/3/trending/tv/week?api_key=62feaff3d2cf094a340f530fbf25bde9";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResults = jsonDecode(response.body)["results"];
      List<TvShow> jsonTvShowList = [];

      for (int i = 0; i < jsonResults.length; i++) {
        jsonTvShowList.add(TvShow.fromJson(jsonResults[i]));
      }
      return jsonTvShowList;
    } else {
      return null;
    }
  }

  static Future<Movie> movieDetails(int selectedId) async {
    String detailsUrl = "https://api.themoviedb.org/3/movie/" +
        selectedId.toString() +
        "?api_key=62feaff3d2cf094a340f530fbf25bde9";

    final response = await http.get(detailsUrl);
    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  static Future<TvShow> tvShowDetails(int selectedId) async {
    String detailsUrl = "https://api.themoviedb.org/3/tv/" +
        selectedId.toString() +
        "?api_key=62feaff3d2cf094a340f530fbf25bde9";

    final response = await http.get(detailsUrl);
    if (response.statusCode == 200) {
      return TvShow.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
