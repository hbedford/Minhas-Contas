import 'dart:io';

import 'package:minhasconta/src/models/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'mywallet.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT NOT NULL,email TEXT NOT NULL)
    CREATE TABLE categories(id INTEGER PRIMARY KEY,name TEXT NOT NULL)
    ''');
  }

  Future<int> registerUser(UserModel user) async {
    Database db = await instance.database;
    int id = await db.insert('users', user.registerToMap);
    return id;
  }

  Future<List<Map<String, dynamic>>> getUserWithEmailAndPassword(
      String email, String password) async {
    Database db = await instance.database;
    return await db.query('select * from users',
        where: 'email = ? and password = ? ', whereArgs: [email, password]);
  }

  Future<int> updateUser(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db
        .update('users', row, where: 'id =?', whereArgs: [row['id']]);
  }

  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
