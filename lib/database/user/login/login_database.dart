import 'dart:async';
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

const String loginTable = 'loginResponse';

class UserLoginDatabaseProvider {
  static final loginDbProvider = UserLoginDatabaseProvider();
  Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;
    // ignore: join_return_with_assignment
    _database = await createDatabase() as Database;
    return _database;
  }

  //creating database if its null for the first time
  createDatabase() async {
    final Directory documentsDirectory =
        await getApplicationDocumentsDirectory();
    //"UserLoginResponse.db is our database instance name
    final String path = join(documentsDirectory.path, "LoginResponse.db");
    final database = await openDatabase(path,
        version: 1, onCreate: initDB, onUpgrade: onUpgrade);
    return database;
  }

  //This is optional, and only used for changing DB schema migrations
  void onUpgrade(Database database, int oldVersion, int newVersion) {
    if (newVersion > oldVersion) {}
  }

  void initDB(Database database, int version) async {
    await database.execute("CREATE TABLE $loginTable ("
        "id INTEGER PRIMARY KEY, "
        "loginResponse TEXT "
        ")");
  }
}
