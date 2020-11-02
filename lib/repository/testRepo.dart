import 'dart:convert';

import 'package:MagicSystem/models/actorModel.dart';
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
      List<Movie> movieList = [];

      for (int i = 0; i < jsonResults.length; i++) {
        movieList.add(Movie.fromJson(jsonResults[i]));
      }
      return movieList;
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
      List<TvShow> tvShowList = [];

      for (int i = 0; i < jsonResults.length; i++) {
        tvShowList.add(TvShow.fromJson(jsonResults[i]));
      }
      return tvShowList;
    } else {
      return null;
    }
  }

  static Future<List<Movie>> bestMovies() async {
    String url =
        "https://api.themoviedb.org/3/movie/top_rated?api_key=62feaff3d2cf094a340f530fbf25bde9&language=en-US&page=1";
    final response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResults = jsonDecode(response.body)["results"];
      List<Movie> movieList = [];

      for (int i = 0; i < jsonResults.length; i++) {
        movieList.add(Movie.fromJson(jsonResults[i]));
      }
      return movieList;
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

  static Future<List<Actor>> castingList(int selectedId, String type) async {
    String detailsUrl = "https://api.themoviedb.org/3/" +
        type +
        "/" +
        selectedId.toString() +
        "/credits?api_key=62feaff3d2cf094a340f530fbf25bde9";

    final response = await http.get(detailsUrl);
    if (response.statusCode == 200) {
      var jsonResults = jsonDecode(response.body)["cast"];
      List<Actor> actorList = [];

      int iteration = jsonResults.length;
      if (iteration > 5) {
        iteration = 5;
      }

      for (int i = 0; i < iteration; i++) {
        print("jsonDecode(response.body) ende");
        print(jsonResults[i]);
        actorList.add(Actor.fromJson(jsonResults[i]));
      }
      return actorList;
    } else {
      return null;
    }
  }
}
