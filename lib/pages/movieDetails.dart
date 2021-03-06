import 'dart:io';

import 'package:MagicSystem/models/actorModel.dart';
import 'package:MagicSystem/models/movieModel.dart';
import 'package:MagicSystem/repository/testRepo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DetailsMoviePage extends StatefulWidget {
  DetailsMoviePage({Key key, this.selectedMovieId}) : super(key: key);

  final int selectedMovieId;

  @override
  _DetailsMoviePageState createState() => _DetailsMoviePageState();
}

class _DetailsMoviePageState extends State<DetailsMoviePage> {
  @override
  Widget build(BuildContext context) {
    int selectedMovieId = widget.selectedMovieId;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Colors.transparent,
      ),
      body: FutureDetailsMovie(selectedMovieId),
    );
  }
}

class FutureDetailsMovie extends StatelessWidget {
  Movie selectedMovie;
  List<Actor> castList;
  int movieId;

  FutureDetailsMovie(int selectedMovieId) {
    this.movieId = selectedMovieId;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Le premier paramètre est la future contenant
        // la valeur que l'on souhaite récuperer.
        //future: Future.delayed(Duration(seconds: 3)),
        future: Testrepo.movieDetails(movieId),

        // La fonction de build permet d'afficher un widget en fonction
        // du résultat contenun dans snapshot
        builder: (context, snapshot) {
          // Tant que le Future n'a pas renvoyé de valeur, on peut
          // afficher un widget temporaire
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: Text("Chargement des films"),
            );
            // On peux vérifier qu'une erreur n'est pas survenue
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Une erreur est survenue"),
            );
          }
          if (snapshot.hasData) {
            selectedMovie = snapshot.data;
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(selectedMovie.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 0.5],
                        colors: [Colors.transparent, Colors.black])),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height * 0.45,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          selectedMovie.title,
                          style: Theme.of(context).textTheme.subtitle1,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Expanded(
                                child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Text(
                                        "12+",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                      Text(
                                        "-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                      Text(
                                        selectedMovie.releaseDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                      Text(
                                        "-",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2,
                                      ),
                                      Row(children: <Widget>[
                                        Icon(
                                          Icons.thumb_up,
                                          color: Colors.pink,
                                          size: 24.0,
                                          semanticLabel: 'thumb up',
                                        ),
                                        Text(
                                          selectedMovie.voteAverage.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText2,
                                        ),
                                      ]),
                                    ]),
                              ),
                              Container(
                                  color: Colors.blue,
                                  width:
                                      MediaQuery.of(context).size.width * 0.4)
                            ]),
                        Wrap(
                          children: selectedMovie.genreList
                              .map((item) => Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.all(16.0),
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )))
                              .toList()
                              .cast<Widget>(),
                        ),
                        Wrap(children: <Widget>[
                          Text(
                            'Cast: ',
                            style: Theme.of(context).textTheme.subtitle2,
                          ),
                          FutureBuilder(
                              future: Testrepo.castingList(
                                  selectedMovie.id, "movie"),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState !=
                                    ConnectionState.done) {
                                  return Center(
                                    child: Text("Chargement des films"),
                                  );
                                  // On peux vérifier qu'une erreur n'est pas survenue
                                } else if (snapshot.hasError) {
                                  print(snapshot);
                                  return Center(
                                    child: Text("Une erreur est survenue"),
                                  );
                                }
                                if (snapshot.hasData) {
                                  castList = snapshot.data;
                                  return Wrap(
                                    children: castList
                                        .map(
                                          (item) => Text(
                                            item.name + "  ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                        )
                                        .toList()
                                        .cast<Widget>(),
                                  );
                                }
                              }),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 32.0),
                          )
                        ]),
                        Text(
                          'Summary',
                          style: Theme.of(context).textTheme.subtitle2,
                        ),
                        Text(
                          selectedMovie.overview,
                          style: Theme.of(context).textTheme.bodyText2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
        },
      ),
    );
  }
}
