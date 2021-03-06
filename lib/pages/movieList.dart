import 'package:MagicSystem/models/movieModel.dart';
import 'package:MagicSystem/models/tvShowModel.dart';
import 'package:MagicSystem/pages/tvShowDetails.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:MagicSystem/repository/testRepo.dart';

import 'movieDetails.dart';

class MovieList extends StatefulWidget {
  MovieList({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MovieListState createState() => MovieListState();
}

class MovieListState extends State<MovieList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.fromLTRB(16, 25, 16, 10),
        child: Text(
          "Popular Movies",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child:
            FuturePopularMovies(Testrepo.weeklyPopularMovies()).build(context),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Text(
          "Popular TV Shows",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: FuturePopularTvShows().build(context),
      ),
      Container(
        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
        child: Text(
          "Best Movies",
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ),
      Container(
        height: MediaQuery.of(context).size.height * 0.25,
        child: FuturePopularMovies(Testrepo.bestMovies()).build(context),
      ),
    ])));
  }
}

class FuturePopularMovies extends StatelessWidget {
  int selectedItemId;
  Future future;
  FuturePopularMovies(Future future) {
    this.future = future;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Le premier paramètre est la future contenant
        // la valeur que l'on souhaite récuperer.
        //future: Future.delayed(Duration(seconds: 3)),
        future: future,

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
            return Center(
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          reverse: false,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Image.network(
                                      snapshot.data[index].imageUrl),
                                ),
                                onTap: () {
                                  selectedItemId = snapshot.data[index].id;

                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    //return DetailPage(item: selectedItem);
                                    return DetailsMoviePage(
                                        selectedMovieId: selectedItemId);
                                  }));
                                });
                          })),
                ],
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

class FuturePopularTvShows extends StatelessWidget {
  TvShow selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Le premier paramètre est la future contenant
        // la valeur que l'on souhaite récuperer.
        //future: Future.delayed(Duration(seconds: 3)),
        future: Testrepo.weeklyPopularTvShows(),

        // La fonction de build permet d'afficher un widget en fonction
        // du résultat contenun dans snapshot
        builder: (context, snapshot) {
          // Tant que le Future n'a pas renvoyé de valeur, on peut
          // afficher un widget temporaire
          if (snapshot.connectionState != ConnectionState.done) {
            return Center(
              child: Text("Chargement des shows"),
            );
            // On peux vérifier qu'une erreur n'est pas survenue
          } else if (snapshot.hasError) {
            print(snapshot);
            return Center(
              child: Text("Une erreur est survenue"),
            );
          }
          if (snapshot.hasData) {
            return Center(
              child: Column(
                children: [
                  Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: snapshot.data.length,
                          reverse: false,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Image.network(
                                      snapshot.data[index].imageUrl),
                                ),
                                onTap: () {
                                  selectedItem = snapshot.data[index];

                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    //return DetailPage(item: selectedItem);
                                    return DetailsTvShowPage(
                                        selectedTvShowId: selectedItem.id);
                                  }));
                                });
                          })),
                ],
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
