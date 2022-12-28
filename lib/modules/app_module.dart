import 'package:case_alura/modules/movies/movies_module.dart';
import 'package:case_alura/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const SplashPage()),
        ModuleRoute(
          '/home_movies',
          module: MoviesModule(),
          transition: TransitionType.downToUp,
          duration: const Duration(milliseconds: 800),
        ),
      ];
}
