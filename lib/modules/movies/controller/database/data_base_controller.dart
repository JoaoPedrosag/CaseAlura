import 'package:case_alura/modules/movies/local_storage/db_help.dart';
import 'package:case_alura/modules/movies/model/movie.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';

part 'data_base_controller.g.dart';

class DataBaseController = _DataBaseController with _$DataBaseController;

abstract class _DataBaseController with Store {
  late Database _database;
  List<Movie> movies = [];
  int teste = 0;
  List<Movie> get returnMoview {
    return movies;
  }

  @action
  getMovie() async {
    _database = await DB.instance.dataBase;
    List moviesMap = await _database.query('movies');
    teste = moviesMap.length;
    print(teste);
  }

  @action
  getAllMovies() async {
    _database = await DB.instance.dataBase;
    List movies = await _database.query('movies');
    print(movies);
  }

  @action
  setMovie(
      {required int idMovie,
      required String title,
      required String backDropPath,
      required String overview,
      required String voteAverage,
      required int runtime,
      required String releaseDate}) async {
    _database = await DB.instance.dataBase;
    await _database.insert('movies', {
      'idMovie': idMovie,
      'title': title,
      'backdrop_path': backDropPath,
      'overview': overview,
      'vote_average': voteAverage,
      'runtime': runtime,
      'release_date': releaseDate
    });
  }
}
