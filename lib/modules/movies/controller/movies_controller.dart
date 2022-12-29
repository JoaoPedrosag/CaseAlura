import 'dart:developer';

import 'package:case_alura/modules/movies/model/movies_model.dart';
import 'package:case_alura/modules/movies/model/only_movie_model.dart';
import 'package:case_alura/modules/movies/service/movies_impl.dart';
import 'package:mobx/mobx.dart';

part 'movies_controller.g.dart';

class MoviesController = _MoviesController with _$MoviesController;

abstract class _MoviesController with Store {
  final repository = MoviesImpl();
  MoviesImpl response = MoviesImpl();
  MoviesTodo moviesTodo = MoviesTodo(movies: []);
  OnyMovieModel onyMovieModel = OnyMovieModel(movie: []);

  @observable
  bool loading = false;

  @observable
  int page = 1;

  @observable
  ObservableList<int> favorite = ObservableList<int>();

  @observable
  HomeState state = HomeState.start;

  Future start() async {
    try {
      state = HomeState.loading;
      moviesTodo = await response.getMovies(page);

      state = HomeState.success;
    } catch (e) {
      state = HomeState.error;
    }
    page++;
  }

  Future getMovie(int id) async {
    try {
      setLoading(true);
      onyMovieModel = await response.getMovie(id);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      log(e.toString());
    }
  }

  @action
  void setLoading(bool value) => loading = value;

  @action
  void addFavorite(int isFavorite) {
    if (favorite.contains(isFavorite)) {
      favorite.remove(isFavorite);
    } else {
      favorite.add(isFavorite);
    }
  }

  @action
  void nextPage() {
    page++;
    response.getMovies(page);
  }
}

enum HomeState { start, loading, success, error }
