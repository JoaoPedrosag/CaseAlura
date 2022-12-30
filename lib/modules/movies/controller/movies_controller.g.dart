// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MoviesController on _MoviesController, Store {
  late final _$loadingAtom =
      Atom(name: '_MoviesController.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$pageAtom =
      Atom(name: '_MoviesController.page', context: context);

  @override
  int get page {
    _$pageAtom.reportRead();
    return super.page;
  }

  @override
  set page(int value) {
    _$pageAtom.reportWrite(value, super.page, () {
      super.page = value;
    });
  }

  late final _$stateAtom =
      Atom(name: '_MoviesController.state', context: context);

  @override
  HomeState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(HomeState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$_MoviesControllerActionController =
      ActionController(name: '_MoviesController', context: context);

  @override
  void changePage() {
    final _$actionInfo = _$_MoviesControllerActionController.startAction(
        name: '_MoviesController.changePage');
    try {
      return super.changePage();
    } finally {
      _$_MoviesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_MoviesControllerActionController.startAction(
        name: '_MoviesController.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_MoviesControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
page: ${page},
state: ${state}
    ''';
  }
}
