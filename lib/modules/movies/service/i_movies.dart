import 'package:case_alura/modules/movies/model/movies_model.dart';

abstract class IMoviesService {
  Future<MoviesTodo> getMovies();
}
