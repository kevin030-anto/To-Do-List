import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'todo.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('todo.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE todos (
        id TEXT PRIMARY KEY,
        todoText TEXT NOT NULL,
        isDone INTEGER NOT NULL
      )
    ''');
  }

  Future<int> insertTask(Todo task) async {
    final db = await instance.database;
    return await db.insert('todos', task.toMap());
  }

  Future<List<Todo>> getTasks() async {
    final db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('todos');
    return maps.map((map) => Todo.fromMap(map)).toList();
  }

  Future<int> updateTask(Todo task) async {
    final db = await instance.database;
    return await db.update('todos', task.toMap(), where: 'id = ?', whereArgs: [task.id]);
  }

  Future<int> deleteTask(String id) async {
    final db = await instance.database;
    return await db.delete('todos', where: 'id = ?', whereArgs: [id]);
  }
}
