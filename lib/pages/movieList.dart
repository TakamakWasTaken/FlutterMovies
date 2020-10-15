import 'package:MagicSystem/models/movieModel.dart';
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
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: Text(''),
        ),
        body: Column(children: [
          Text(
            "Popular Movies",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Container(
            height: 200,
            child: FutureTest().build(context),
          ),
        ]));
  }
}

class FutureTest extends StatelessWidget {
  Movie selectedItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        // Le premier paramètre est la future contenant
        // la valeur que l'on souhaite récuperer.
        //future: Future.delayed(Duration(seconds: 3)),
        future: Testrepo.fetchData(),

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
            print("snapshot");
            print(snapshot);
            return Center(
              child: Text("Une erreur est survenue"),
            );
          }
          if (snapshot.hasData) {
            print(snapshot);
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
                                child: Image.network(
                                    snapshot.data[index].imageUrl),
                                onTap: () {
                                  selectedItem = snapshot.data[index];

                                  // To remove the previously selected detail page
                                  while (Navigator.of(context).canPop()) {
                                    Navigator.of(context).pop();
                                  }

                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) {
                                    //return DetailPage(item: selectedItem);
                                    return DetailsPage(
                                        selectedMovie: selectedItem);
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
