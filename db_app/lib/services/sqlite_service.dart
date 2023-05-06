import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/task.dart';

class SqliteService {
  static Future<Database> initializeDB() async {
    String dbPath = await getDatabasesPath();

    return openDatabase(join(dbPath, 'todo.db'), onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE Todos(id INTEGER PRIMARY KEY AUTOINCREMENT, task TEXT NOT NULL, dueDate TEXT NOT NULL)");
    }, version: 1);
  }

  // CRUD -> Create, Read, Update, Delete

  // Create
  static Future<int> createTask(Task task) async {
    final Database db = await initializeDB();
    return await db.insert('Todos', task.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  // Read
  static Future<List<Task>> getTasks() async {
    final Database db = await initializeDB();
    final List<Map<String, dynamic>> queryResult = await db.query('Todos');
    return queryResult.map((q) => Task.fromJson(q)).toList();
  }

  // Update
  static Future<void> updateTask(int id, Task newTask) async {
    final Database db = await initializeDB();
    await db.update(
      'Todos',
      newTask.toJson(),
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  // Delete
  static Future<void> deleteTask(int id) async {
    final Database db = await initializeDB();
    await db.delete('Todos', where: "id = ?", whereArgs: [id]);
  }
}
