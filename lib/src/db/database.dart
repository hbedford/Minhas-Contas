import 'dart:io';

import 'package:minhasconta/src/models/category_model.dart';
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
    await db.execute(
        "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT NOT NULL,email TEXT NOT NULL UNIQUE,password TEXT NOT NULL,pin INT);");
    await db.execute(
        "CREATE TABLE categories(id INTEGER PRIMARY KEY,name TEXT NOT NULL,color TEXT NOT NULL);");
    await db.execute(
        "CREATE TABLE subcategories(id INTEGER PRIMARY KEY,name TEXT NOT NULL,category_id INTEGER, FOREIGN KEY(category_id)REFERENCES categories);");
    await db.execute(
        "CREATE TABLE cards(id INTEGER PRIMARY KEY,name TEXT NOT NULL,user_id INTEGER,number TEXT,color TEXT NOT NULL,limitcard REAL, FOREIGN KEY(user_id) REFERENCES users);");
  }

  Future<int> registerUser(UserModel user) async {
    try {
      Database db = await instance.database;

      return await db.insert('users', user.map);
    } catch (e) {
      return null;
    }
  }

  Future<int> registerCategory(CategoryModel category) async {
    Database db = await instance.database;
    int id = await db.insert('categories', category.registerToMapCategory);
    return id;
  }

  Future<int> registerSubCategory(CategoryModel subcategory) async {
    Database db = await instance.database;
    int id =
        await db.insert('subcategories', subcategory.registerToMapSubCategory);
    return id;
  }

  Future<List> getCategories() async {
    Database db = await instance.database;
    List<Map> list = await db.query('categories');
    List<CategoryModel> l = list.map((e) => CategoryModel.fromMap(e)).toList();
    return l;
  }

  Future<UserModel> getUserWithEmailAndPassword(
      String email, String password) async {
    Database db = await instance.database;
    List<Map> list = await db.query('users',
        where: 'email = ? and password = ? ', whereArgs: [email, password]);
    return list.length > 0 ? UserModel.fromMap(list.first) : null;
  }

  Future<int> addPIN(int pin, int id) async {
    Database db = await instance.database;
    return await db
        .rawUpdate('UPDATE users SET pin = ? WHERE id = ?', [pin, id]);
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
