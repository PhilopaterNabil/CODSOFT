import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do/models/task.dart';

class DBHelper {
  static Database? _db;
  static const int _version = 1;
  static const String _tableName = 'tasks';

  static Future<void> initDb() async {
    if (_db != null) {
      debugPrint('not null dp');
      return;
    } else {
      try {
        String path = '${await getDatabasesPath()}task.db';
        _db = await openDatabase(
          path,
          version: _version,
          onCreate: (Database db, int version) async {
            debugPrint('creating a new one');
            await db.execute(
              'CREATE TABLE $_tableName (id INTEGER PRIMARY KEY AUTOINCREMENT, title STRING, note TEXT, date STRING, '
              'startTime STRING, endTime STRING, remind INTEGER, repeat STRING, color INTEGER, '
              'isCompleted INTEGER)',
            );
          },
        );
      } catch (e) {
        log(e.toString());
      }
    }
  }

  static Future<int> insert(Task task) async {
    return await _db!.insert(_tableName, task.toJson());
  }

  static Future<int> delete(Task task) async {
    return await _db!.delete(_tableName, where: 'id = ?', whereArgs: [task.id]);
  }

  static Future<int> deleteAll() async {
    return await _db!.delete(_tableName);
  }

  static Future<int> update(int id) async {
    return await _db!.rawUpdate(
      'UPDATE $_tableName SET isCompleted = ? WHERE id = ?',
      [1, id],
    );
  }

  static Future<List<Map<String, dynamic>>> query() async {
    return await _db!.query(_tableName);
  }

  static Future<List<Map<String, dynamic>>> rawQuery(String sql) async {
    return await _db!.rawQuery(sql);
  }
}
