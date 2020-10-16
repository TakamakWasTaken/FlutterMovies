class Actor {
  final String character;
  final String creditId;
  final int id;
  final String name;
  final int gender;
  final String profilePath;
  final int order;

  Actor(
      {this.character,
      this.creditId,
      this.id,
      this.name,
      this.gender,
      this.profilePath,
      this.order});

  factory Actor.fromJson(Map<String, dynamic> parsedJson) {
    String imageUrl;

    if (parsedJson['profile_path'] != null) {
      imageUrl = "https://image.tmdb.org/t/p/w500" + parsedJson['profile_path'];
    } else {
      imageUrl = "";
    }
    return Actor(
        character: parsedJson['character'],
        creditId: parsedJson['credit_id'],
        id: parsedJson['id'],
        name: parsedJson['name'],
        gender: parsedJson['gender'],
        profilePath: imageUrl,
        order: parsedJson['order']);
  }
}
