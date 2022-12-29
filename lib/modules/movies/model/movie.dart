class Movie {
  final int idMovie;
  final String title;
  final String backdropPath;
  final String overview;
  final String voteAverage;
  final String runtime;
  final String releaseDate;

  Movie(
      {required this.idMovie,
      required this.title,
      required this.backdropPath,
      required this.overview,
      required this.voteAverage,
      required this.runtime,
      required this.releaseDate});
}
