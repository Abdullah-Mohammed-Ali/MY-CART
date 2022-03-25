import 'dart:async';
import 'dart:core';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalDB {
  Database? _database;
  String path = 'test2.db';

  Future<void> createDatabase() async {
    _database =
        await openDatabase(path, version: 1, onCreate: (db, version) async {
      db.execute('CREATE TABLE test (id INTEGER PRIMARY KEY,name STRING)');
    }, onOpen: (db) async {
      print('Database is Opened');
    });
  }

  Future<void> insertIntoDatabase({required String name}) async {
    await _database!.transaction((tx) async {
      await tx.rawInsert('INSERT Into test (name) VALUES ("$name")');
    });
  }

  Future<List<Map>> getAllDate() async {
    List<Map> result = await _database!.rawQuery('Select * from test');
    return result;
  }

  Future<void> deleteFromDb({required String name}) async {
    await _database!.rawDelete("Delete FROM test WHERE name = $name");
    await getAllDate().then((val) => print(val.toString()));
  }

  Future<void> updateData({required String name}) async {
    try {
      _database!.transaction(
        (txn) async => await txn.rawUpdate('UPDATE test SET name = ?', [name]),
      );
      getAllDate().then((val) => print(val.toString()));
    } catch (e) {
      print('error Happened');
    }
  }
}
