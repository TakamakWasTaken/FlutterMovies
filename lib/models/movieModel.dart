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
    int voteCount;

    if (parsedJson['vote_count'] == null) {
      voteCount = 0;
    } else {
      voteCount = parsedJson['vote_count'];
    }

    return Movie(
        title: parsedJson['title'],
        id: parsedJson['id'],
        releaseDate: parsedJson['release_date'],
        overview: parsedJson['overview'],
        voteCount: voteCount,
        imageUrl:
            "https://image.tmdb.org/t/p/w500" + parsedJson['poster_path']);
  }
}
