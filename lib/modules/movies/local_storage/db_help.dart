import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  DB._();

  static final DB instance = DB._();

  static Database? _database;

  get dataBase async {
    if (_database != null) return _database;
    return _database = await _initDatabase();
  }

  _initDatabase() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'movies.db'),
      version: 1,
      onCreate: _onCreate,
    );
  }

  _onCreate(db, version) async {
    await db.execute(
      (_moviesTable),
    );
  }

  String get _moviesTable => '''
    CREATE TABLE movies(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      idMovie INTEGER
    )
  ''';
}
