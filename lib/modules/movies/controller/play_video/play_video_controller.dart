import 'dart:developer';

import 'package:case_alura/modules/movies/model/movie_video_model.dart';
import 'package:case_alura/modules/movies/service/movies_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'play_video_controller.g.dart';

class PlayVideoController = _PlayVideoController with _$PlayVideoController;

abstract class _PlayVideoController with Store {
  final response = Modular.get<MoviesImpl>();
  MovieVideo video = MovieVideo(video: []);
  @observable
  bool loadingVideo = false;

  @observable
  String key = '';

  @action
  void setKey(String value) => key = value;

  @action
  void setLoading(bool value) => loadingVideo = value;

  Future getVideoMovie(int id) async {
    try {
      setLoading(true);
      video = await response.getVideoMovie(id);
      var videoKey = video.results![0].key;
      if (video.results!.isEmpty) {
        setLoading(false);
        return;
      }
      setKey(videoKey!);
      setLoading(false);
    } catch (e) {
      setLoading(false);
      log(e.toString());
    }
  }
}
