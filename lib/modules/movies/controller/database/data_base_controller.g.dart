// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_base_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataBaseController on _DataBaseController, Store {
  late final _$getMovieAsyncAction =
      AsyncAction('_DataBaseController.getMovie', context: context);

  @override
  Future getMovie() {
    return _$getMovieAsyncAction.run(() => super.getMovie());
  }

  late final _$getAllMoviesAsyncAction =
      AsyncAction('_DataBaseController.getAllMovies', context: context);

  @override
  Future getAllMovies() {
    return _$getAllMoviesAsyncAction.run(() => super.getAllMovies());
  }

  late final _$setMovieAsyncAction =
      AsyncAction('_DataBaseController.setMovie', context: context);

  @override
  Future setMovie(
      {required int idMovie,
      required String title,
      required String backDropPath,
      required String overview,
      required String voteAverage,
      required int runtime,
      required String releaseDate}) {
    return _$setMovieAsyncAction.run(() => super.setMovie(
        idMovie: idMovie,
        title: title,
        backDropPath: backDropPath,
        overview: overview,
        voteAverage: voteAverage,
        runtime: runtime,
        releaseDate: releaseDate));
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
