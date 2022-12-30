// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_video_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PlayVideoController on _PlayVideoController, Store {
  late final _$loadingVideoAtom =
      Atom(name: '_PlayVideoController.loadingVideo', context: context);

  @override
  bool get loadingVideo {
    _$loadingVideoAtom.reportRead();
    return super.loadingVideo;
  }

  @override
  set loadingVideo(bool value) {
    _$loadingVideoAtom.reportWrite(value, super.loadingVideo, () {
      super.loadingVideo = value;
    });
  }

  late final _$keyAtom =
      Atom(name: '_PlayVideoController.key', context: context);

  @override
  String get key {
    _$keyAtom.reportRead();
    return super.key;
  }

  @override
  set key(String value) {
    _$keyAtom.reportWrite(value, super.key, () {
      super.key = value;
    });
  }

  late final _$_PlayVideoControllerActionController =
      ActionController(name: '_PlayVideoController', context: context);

  @override
  void setKey(String value) {
    final _$actionInfo = _$_PlayVideoControllerActionController.startAction(
        name: '_PlayVideoController.setKey');
    try {
      return super.setKey(value);
    } finally {
      _$_PlayVideoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$_PlayVideoControllerActionController.startAction(
        name: '_PlayVideoController.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$_PlayVideoControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loadingVideo: ${loadingVideo},
key: ${key}
    ''';
  }
}
