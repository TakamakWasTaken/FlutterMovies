import 'package:MagicSystem/pages/login.dart';
import 'package:MagicSystem/pages/movieList.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'pages/movieDetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyCustomForm(),
      title: 'NetFluxter',
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.brown,
        primaryColor: Colors.white,
        accentColor: Colors.white,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default TextTheme. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        textTheme: TextTheme(
          subtitle1: TextStyle(
              fontSize: 28.0, fontWeight: FontWeight.bold, color: Colors.white),
          subtitle2: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          bodyText2: TextStyle(fontSize: 14.0, color: Colors.white),
          bodyText1: TextStyle(
              fontSize: 14.0, color: Colors.white, fontStyle: FontStyle.italic),
        ),
      ),
      routes: {
        '/details': (BuildContext context) => DetailsMoviePage(),
        '/list': (BuildContext context) => MovieList(title: 'nomdufilm'),
      },
    );
  }
}
