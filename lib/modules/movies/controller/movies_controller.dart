import 'dart:developer';
import 'package:case_alura/modules/movies/model/movies_model.dart';
import 'package:case_alura/modules/movies/model/only_movie_model.dart';
import 'package:case_alura/modules/movies/service/movies_impl.dart';
import 'package:mobx/mobx.dart';
part 'movies_controller.g.dart';

class MoviesController = _MoviesController with _$MoviesController;

abstract class _MoviesController with Store {
  MoviesImpl response = MoviesImpl();
  MoviesTodo moviesTodo = MoviesTodo(movies: []);
  OnyMovieModel onlyMovieModel = OnyMovieModel(movie: []);

  @observable
  bool loading = false;

  @observable
  int page = 0;

  @observable
  HomeState state = HomeState.start;

  @action
  void changePage() => {
        page = 0,
        start(),
      };

  Future start() async {
    page++;
    moviesTodo.totalPages == page ? page = 1 : page;
    try {
      state = HomeState.loading;
      moviesTodo = await response.getMovies(page);
      state = HomeState.success;
    } catch (e) {
      state = HomeState.error;
    }
  }

  Future getMovie(int id) async {
    try {
      setLoading(true);
      onlyMovieModel = await response.getMovie(id);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      log(e.toString());
    }
  }

  @action
  void setLoading(bool value) => loading = value;
}

enum HomeState { start, loading, success, error }
