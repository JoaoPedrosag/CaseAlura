import 'package:case_alura/modules/movies/controller/database/data_base_controller.dart';
import 'package:case_alura/modules/movies/controller/movies_controller.dart';
import 'package:case_alura/modules/movies/controller/play_video/play_video_controller.dart';
import 'package:case_alura/modules/movies/pages/favorite_movie_page.dart';
import 'package:case_alura/modules/movies/pages/movies_page.dart';
import 'package:case_alura/modules/movies/pages/watch_video_page.dart';
import 'package:case_alura/modules/movies/service/movies_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviesModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton(
          (i) => MoviesController(),
        ),
        Bind.lazySingleton(
          (i) => DataBaseController(),
        ),
        Bind.lazySingleton(
          (i) => PlayVideoController(),
        ),
        Bind.lazySingleton(
          (i) => MoviesImpl(),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (_, args) => const MoviesPage(),
        ),
        ChildRoute(
          '/favorite',
          child: (_, args) => const FavoriteMoviePage(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
        ChildRoute(
          '/watch',
          child: (_, args) => const WatchVideoPage(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
      ];
}
