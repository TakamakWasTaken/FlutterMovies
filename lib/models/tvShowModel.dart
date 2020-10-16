class TvShow {
  final String title;
  final int id;
  final String imageUrl;
  final String releaseDate;
  final String overview;
  final int voteCount;

  TvShow(
      {this.title,
      this.id,
      this.imageUrl,
      this.releaseDate,
      this.overview,
      this.voteCount});

  factory TvShow.fromJson(Map<String, dynamic> parsedJson) {
    /*int voteCount;

    if (parsedJson['vote_count'] == null) {
      voteCount = 0;
    } else {
      voteCount = parsedJson['vote_count'];
    }*/

    return TvShow(
        title: parsedJson['name'],
        id: parsedJson['id'],
        releaseDate: parsedJson['first_air_date'],
        overview: parsedJson['overview'],
        voteCount: parsedJson['vote_count'],
        imageUrl:
            "https://image.tmdb.org/t/p/w500" + parsedJson['poster_path']);
  }
}
