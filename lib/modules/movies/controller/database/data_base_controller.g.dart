// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_base_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$DataBaseController on _DataBaseController, Store {
  late final _$moviesAtom =
      Atom(name: '_DataBaseController.movies', context: context);

  @override
  List<dynamic> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(List<dynamic> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  late final _$idsAtom =
      Atom(name: '_DataBaseController.ids', context: context);

  @override
  List<dynamic> get ids {
    _$idsAtom.reportRead();
    return super.ids;
  }

  @override
  set ids(List<dynamic> value) {
    _$idsAtom.reportWrite(value, super.ids, () {
      super.ids = value;
    });
  }

  late final _$getAllMoviesAsyncAction =
      AsyncAction('_DataBaseController.getAllMovies', context: context);

  @override
  Future getAllMovies() {
    return _$getAllMoviesAsyncAction.run(() => super.getAllMovies());
  }

  late final _$deleteMovieAsyncAction =
      AsyncAction('_DataBaseController.deleteMovie', context: context);

  @override
  Future deleteMovie(int idMovie) {
    return _$deleteMovieAsyncAction.run(() => super.deleteMovie(idMovie));
  }

  late final _$setMovieAsyncAction =
      AsyncAction('_DataBaseController.setMovie', context: context);

  @override
  Future setMovie(
      {required int idMovie,
      required String title,
      required String posterPath,
      required String overview,
      required String voteAverage,
      required int runtime,
      required String releaseDate}) {
    return _$setMovieAsyncAction.run(() => super.setMovie(
        idMovie: idMovie,
        title: title,
        posterPath: posterPath,
        overview: overview,
        voteAverage: voteAverage,
        runtime: runtime,
        releaseDate: releaseDate));
  }

  late final _$_DataBaseControllerActionController =
      ActionController(name: '_DataBaseController', context: context);

  @override
  void addNewFavorite(int id) {
    final _$actionInfo = _$_DataBaseControllerActionController.startAction(
        name: '_DataBaseController.addNewFavorite');
    try {
      return super.addNewFavorite(id);
    } finally {
      _$_DataBaseControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
movies: ${movies},
ids: ${ids}
    ''';
  }
}
