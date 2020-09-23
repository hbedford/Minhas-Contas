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
    return await openDatabase(path, version: 2, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT NOT NULL,email TEXT NOT NULL,password TEXT NOT NULL);
    CREATE TABLE categories(id INTEGER PRIMARY KEY,name TEXT NOT NULL,type_id INTEGET NOT NULL, FOREIGN KEY (type_id)REFERENCES category_types);
    CREATE TABLE category_types(id INTEGER PRIMARY KEY,)
    CREATE TABLE creditcards(id INTEGER PRIMARY KEY,name TEXT NOT NULL,user_id INTEGER, FOREIGN KEY(user_id) REFERENCES users)
    ''');
  }

  Future<int> registerUser(UserModel user) async {
    Database db = await instance.database;
    int id = await db.insert('users', user.registerToMap);
    return id;
  }

  Future<UserModel> getUserWithEmailAndPassword(
      String email, String password) async {
    Database db = await instance.database;
    List<Map> list = await db.query('users',
        where: 'email = ? and password = ? ', whereArgs: [email, password]);
    return list.length > 0 ? UserModel.fromMap(list.first) : null;
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
