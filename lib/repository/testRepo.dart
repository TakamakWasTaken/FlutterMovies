import 'dart:convert';

import 'package:MagicSystem/models/movieModel.dart';
import 'package:http/http.dart' as http;

class Testrepo {
  static Future<List<Movie>> fetchData() async {
    //String url ="https://api.themoviedb.org/3/movie/76341?api_key=62feaff3d2cf094a340f530fbf25bde9";

    String movieTrendUrl =
        "https://api.themoviedb.org/3/trending/movie/week?api_key=62feaff3d2cf094a340f530fbf25bde9";
    final response = await http.get(movieTrendUrl);
    if (response.statusCode == 200) {
      print(response.body);
      print(response.statusCode);
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
}
