import 'dart:developer';

import 'package:case_alura/modules/movies/service/movies_impl.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  MoviesImpl response = MoviesImpl();
  List<int> id = [];
  test('must search all movies', () async {
    int page = 1;
    final test = await response.getMovies(page);
    expect(test.results!.isNotEmpty, true);
    id = test.results!.map((e) => e.id!).toList();
  });

  test('must return a single movie', () async {
    final testGetMovie = await response.getMovie(id[0]);
    expect(testGetMovie.id, id[0]);
  });

  test('must return the video with a key', () async {
    final testGetVideo = response
        .getVideoMovie(id[0])
        .then((value) => log(value.results![0].key.toString()));

    expect(testGetVideo, isNotNull);
  });
}
