import 'package:case_alura/modules/movies/controller/movies_controller.dart';
import 'package:case_alura/modules/movies/model/movies_model.dart';
import 'package:case_alura/modules/movies/service/movies_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:mobx/mobx.dart';
import 'package:mockito/mockito.dart';

void main() {
  test('must fill in the variable movieTodo', () async {
    final movieController = MoviesController();
    await movieController.start();
    var result = movieController.moviesTodo;
    print(result.totalPages);
    expect(result.page, 1);
  });
}
