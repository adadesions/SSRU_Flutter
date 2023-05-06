import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqliteService {
  Future<Database> initializeDB() async {
    String dbPath = await getDatabasesPath();

    return openDatabase(
      join(dbPath, 'todo.db'),
      onCreate: (db, version) async {
        await db.execute(
            "CREATE TABLE Todos(id INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT NOT NULL, dueDate TEXT NOT NULL)");
      },
      version: 1
    );
  }
}
