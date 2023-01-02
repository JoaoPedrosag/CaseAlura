import 'package:case_alura/modules/movies/local_storage/db_help.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';

part 'data_base_controller.g.dart';

class DataBaseController = _DataBaseController with _$DataBaseController;

abstract class _DataBaseController with Store {
  late Database _database;

  @observable
  List movies = [];

  @observable
  List ids = [];

  @observable
  bool empty = false;

  @action
  void setEmpty(bool value) {
    empty = value;
  }

  @action
  getAllMovies() async {
    _database = await DB.instance.dataBase;
    movies = await _database.query('movies');
    ids = movies.map((e) => e['idMovie']).toList();
    setEmpty(ids.isEmpty);
  }

  @action
  void addNewFavorite(int id) {
    ids.add(id);
  }

  @action
  void removeFavorite(int id) {
    ids.remove(id);
    ids.isEmpty ? setEmpty(true) : setEmpty(false);
  }

  @action
  deleteMovie(int idMovie) async {
    _database = await DB.instance.dataBase;
    await _database
        .delete('movies', where: 'idMovie = ?', whereArgs: [idMovie]);
    removeFavorite(idMovie);
  }

  @action
  setMovie(
      {required int idMovie,
      required String title,
      required String posterPath,
      required String overview,
      required String voteAverage,
      required int runtime,
      required String releaseDate}) async {
    _database = await DB.instance.dataBase;
    await _database.insert('movies', {
      'idMovie': idMovie,
      'title': title,
      'poster_path': posterPath,
      'overview': overview,
      'vote_average': voteAverage,
      'runtime': runtime,
      'release_date': releaseDate
    });
  }
}
