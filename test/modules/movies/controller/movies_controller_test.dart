import 'package:case_alura/modules/movies/controller/movies_controller.dart';
import 'package:case_alura/modules/movies/service/movies_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  List ids = [];
  final movieController = MoviesController();
  final response = MoviesImpl();
  test('must fill in the variable movieTodo', () async {
    await movieController.start();
    var result = movieController.moviesTodo;
    for (var element in movieController.moviesTodo.results!) {
      ids.add(element.id);
      expect(element.title, isNotNull);
    }

    expect(result.page, 1);
  });

  test('must fill in the variable movieDone', () async {
    movieController.onlyMovieModel = await response.getMovie(ids[0]);
    expect(movieController.onlyMovieModel.title, isNotNull);
  });

  test('must change loading state', () {
    movieController.setLoading(true);
    expect(movieController.loading, true);
  });

  test('must go back to page 1', () {
    movieController.changePage();
    expect(movieController.page, 1);
  });
}
