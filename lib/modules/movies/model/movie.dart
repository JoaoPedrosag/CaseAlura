class Movie {
  final int idMovie;
  final String title;
  final String posterPath;
  final String backdropPath;
  final String overview;
  final String releaseDate;

  Movie(
      {required this.idMovie,
      required this.title,
      required this.posterPath,
      required this.backdropPath,
      required this.overview,
      required this.releaseDate});

  static fromMap(e) {}
}
