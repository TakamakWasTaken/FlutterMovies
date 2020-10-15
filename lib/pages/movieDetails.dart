import 'package:MagicSystem/models/movieModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key key, this.selectedMovie}) : super(key: key);

  final Movie selectedMovie;

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  var itemAgeLimit = "12+";
  var itemTitle = "Gravity";
  var itemReleaseDate = "2020";
  var itemRating = 73;
  var itemSummary =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.";
  var itemCast = "A dude";
  var itemGenre = "Space opéra";
  @override
  Widget build(BuildContext context) {
    Movie selectedMovie = widget.selectedMovie;
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMovie.title),
      ),
      body: Container(
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
                height: MediaQuery.of(context).size.height * 0.4,
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
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: <Widget>[
                                Text(
                                  itemAgeLimit,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "-",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  selectedMovie.releaseDate,
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Text(
                                  "-",
                                  style: Theme.of(context).textTheme.bodyText2,
                                ),
                                Row(children: <Widget>[
                                  Icon(
                                    Icons.thumb_up,
                                    color: Colors.pink,
                                    size: 24.0,
                                    semanticLabel:
                                        'Text to announce in accessibility modes',
                                  ),
                                  Text(
                                    itemRating.toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                ]),
                              ]),
                        ),
                        Container(
                            color: Colors.blue,
                            width: MediaQuery.of(context).size.width * 0.4)
                      ]),
                  Card(
                      child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      itemGenre,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  )),
                  Row(children: <Widget>[
                    Text(
                      'Cast: ',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
                    Text(
                      itemCast,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                    )
                  ]),
                  Text(
                    'Summary',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),
                  Text(
                    itemSummary,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
