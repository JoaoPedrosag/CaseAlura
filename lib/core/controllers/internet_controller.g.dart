// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internet_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InternetController on _InternetController, Store {
  late final _$internetAtom =
      Atom(name: '_InternetController.internet', context: context);

  @override
  bool get internet {
    _$internetAtom.reportRead();
    return super.internet;
  }

  @override
  set internet(bool value) {
    _$internetAtom.reportWrite(value, super.internet, () {
      super.internet = value;
    });
  }

  late final _$checkInternetAsyncAction =
      AsyncAction('_InternetController.checkInternet', context: context);

  @override
  Future checkInternet() {
    return _$checkInternetAsyncAction.run(() => super.checkInternet());
  }

  @override
  String toString() {
    return '''
internet: ${internet}
    ''';
  }
}
