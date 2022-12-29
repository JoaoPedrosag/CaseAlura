import 'package:case_alura/modules/movies/model/movies_model.dart';
import 'package:case_alura/modules/movies/model/only_movie_model.dart';

abstract class IMoviesService {
  Future<MoviesTodo> getMovies(int page);
  Future<OnyMovieModel> getMovie(int id);
}
