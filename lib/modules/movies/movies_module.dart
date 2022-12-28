import 'package:case_alura/modules/movies/pages/movies_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviesModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (_, args) => const MoviesPage()),
      ];
}
