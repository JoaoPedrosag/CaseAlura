import 'package:case_alura/modules/movies/service/movies_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('must search all movies', () async {
    int page = 1;
    MoviesImpl response = MoviesImpl();
    final test = await response.getMovies(page);
    expect(test.results!.isNotEmpty, true);
  });
}
