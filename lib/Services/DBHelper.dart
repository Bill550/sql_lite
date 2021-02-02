import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
import 'package:sql_lite/Model/Model.dart';

abstract class DB {
  static Database _db;

  static int get _version => 2;

  static Future<void> init() async {
    if (_db != null) {
      return;
    }

    try {
      var databasePath = await getDatabasesPath();
      String _path = p.join(databasePath, 'names.db');
      _db = await openDatabase(_path, version: _version, onCreate: onCreate);
    } catch (e) {
      print(e);
    }
  }

  static void onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE names(id INTEGER PRIMARY KEY AUTOINCREMENT, name STRING, lastname STRING)');
        //All command will be Capital And name will be Small Letter
  }

  static Future<List<Map<String, dynamic>>> query(String table) async =>
      _db.query(table);

  static Future<int> insert(String table, Model model) async =>
      await _db.insert(table, model.toMap());

  static Future<int> update(String table, Model model) async => await _db
      .update(table, model.toMap(), where: 'id = ?', whereArgs: [model.id]);

  static Future<int> delete(String table, Model model) async =>
      await _db.delete(table, where: 'id = ?', whereArgs: [model.id]);

  static Future<Batch> batch() async => _db.batch();
}
