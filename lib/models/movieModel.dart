class Movie {
  final String title;
  final int id;
  final String imageUrl;
  final String releaseDate;
  final String overview;
  final int voteCount;

  Movie(
      {this.title,
      this.id,
      this.imageUrl,
      this.releaseDate,
      this.overview,
      this.voteCount});

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    String titleOrName;
    String releaseDate;
    int voteCount;
    if (parsedJson['title'] != null) {
      titleOrName = parsedJson['title'];
    } else {
      titleOrName = parsedJson['name'];
    }

    if (parsedJson['release_date'] != null) {
      releaseDate = parsedJson['release_date'];
    } else {
      releaseDate = parsedJson['first_air_date'];
    }

    if (parsedJson['vote_count'] == null) {
      voteCount = 0;
    } else {
      voteCount = parsedJson['vote_count'];
    }

    return Movie(
        title: titleOrName,
        id: parsedJson['id'],
        releaseDate: releaseDate,
        overview: parsedJson['overview'],
        voteCount: voteCount,
        imageUrl:
            "https://image.tmdb.org/t/p/w500" + parsedJson['poster_path']);
  }
}
