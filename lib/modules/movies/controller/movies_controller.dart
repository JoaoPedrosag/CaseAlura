import 'package:case_alura/modules/movies/model/movies_model.dart';
import 'package:case_alura/modules/movies/service/movies_impl.dart';
import 'package:mobx/mobx.dart';

part 'movies_controller.g.dart';

class MoviesController = _MoviesController with _$MoviesController;

abstract class _MoviesController with Store {
  final repository = MoviesImpl();
  MoviesImpl response = MoviesImpl();
  MoviesTodo moviesTodo = MoviesTodo(movies: []);

  @observable
  HomeState state = HomeState.start;

  Future start() async {
    try {
      state = HomeState.loading;
      moviesTodo = await response.getMovies();
      print(moviesTodo);
      state = HomeState.success;
    } catch (e) {
      changeState(HomeState.error);
    }
  }

  void changeState(HomeState stateA) {
    state = stateA;
  }
}

enum HomeState { start, loading, success, error }
