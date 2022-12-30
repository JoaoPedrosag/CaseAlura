class Movie {
  final int idMovie;
  final String title;
  final String posterPath;
  final String overview;
  final String voteAverage;
  final int runtime;
  final String releaseDate;

  Movie(
      {required this.idMovie,
      required this.title,
      required this.posterPath,
      required this.overview,
      required this.voteAverage,
      required this.runtime,
      required this.releaseDate});
}
