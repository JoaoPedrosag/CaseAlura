import 'package:case_alura/modules/movies/controller/database/data_base_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  sqfliteFfiInit();
  final controller = DataBaseController();
  List movies = [];
  List ids = [];
  var factory = databaseFactoryFfi;
  var db = await factory.openDatabase(inMemoryDatabasePath,
      options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute(
                'CREATE TABLE test(id INTEGER PRIMARY KEY AUTOINCREMENT, idMovie INTEGER, title TEXT, poster_path TEXT, overview TEXT, vote_average TEXT, runtime INTEGER, release_date TEXT)');
          }));
  test('should return inserting a movie', () async {
    await db.insert('test', {
      'idMovie': 20,
      'title': "title teste",
      'poster_path': "poster teste",
      'overview': "sinopse teste",
      'vote_average': "nota teste",
      'runtime': 187,
      'release_date': "data teste"
    });
    movies = await db.query('test');
    ids = movies.map((e) => e['idMovie']).toList();
    expect(movies.isEmpty, false);
    expect(ids, [20]);
  });

  test('must delete a movie', () async {
    await db.delete('test', where: 'idMovie = ?', whereArgs: [20]);
    movies = await db.query('test');
    expect(movies.isEmpty, true);
    await db.close();
  });
}
