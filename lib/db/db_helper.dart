import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

import '../models/task.dart';

class DBHelper {
  static const int _version = 1;
  static const String _tabelName = 'tasks';
  static Database? _db;

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('Not Null Db');
      return;
    } else {
      try {
        var databasesPath = await getDatabasesPath();
        String _path = path.join(databasesPath, 'task.db');
        _db = await openDatabase(_path, version: _version,
            onCreate: (Database db, int version) async {
              // When creating the db, create the table
              await db.execute('CREATE TABLE $_tabelName  ('
                  'id INTEGER PRIMARY KEY, '
                  'title STRING, '
                  'note TEXT, '
                  'isCompleted INTEGER, '
                  'date STRING, '
                  'startTime STRING, '
                  'endTime STRING, '
                  'color INTEGER, '
                  'remind INTEGER, '
                  'repeat STRING )');
            });
        debugPrint('Data Has been Created');
      } catch (e) {
        print(e);
      }
    }
  }


  static Future<int>  insert(Task? task) async {
    print('The Data is Insert');
    try {
      return await _db!.insert(_tabelName, task!.toJson());
    } catch (e) {
      print('$e');
      return 9000;
    }
  }
  static Future<List<Map<String, dynamic>>> query() async {
    print('The Data is Query');
    return await _db!.query(_tabelName);
  }

  static Future<int> update(int id) async {
    print('The Data is Update');
    return await _db!.rawUpdate('''
      UPDATE tasks
      SET isCompleted = ?
      WHERE id = ? 
      ''', [1, id]);
  }

  static Future<int> delete(Task task) async {
    print('The Data is Delte');
    return await _db!
        .delete(_tabelName, where: 'id = ? ', whereArgs: [task.id]);
  }

  static Future<int> deleteAll() async {
    print('The Data is Delte');
    return await _db!
        .delete(_tabelName);
  }
}
