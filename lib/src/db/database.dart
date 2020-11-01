import 'dart:io';

import 'package:minhasconta/src/models/card_model.dart';
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
    await db.execute(UserDB().createTable);
    await db.execute(CategoryDB().createTable);
    await db.execute(
        "CREATE TABLE subcategories(id INTEGER PRIMARY KEY,name TEXT NOT NULL,category_id INTEGER, FOREIGN KEY(category_id)REFERENCES categories);");
    await db.execute(CardDB().createTable);
    await db.execute(PaymentDB().createTable);
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
}

class CardDB {
  CardDB();
  get createTable =>
      "CREATE TABLE cards(id INTEGER PRIMARY KEY,name TEXT NOT NULL,user_id INTEGER,number TEXT,color INTEGER NOT NULL,limitcard REAL,credit INTEGER,debit INTEGER, FOREIGN KEY(user_id) REFERENCES users);";
  Future<List<CardModel>> getCards(int userId) async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> list =
        await db.query('cards', where: 'user_id = ?', whereArgs: [userId]);
    return list.length > 0
        ? list.map((e) => CardModel.fromMap(e)).toList()
        : [];
  }

  Future<int> registerCard(CardModel card) async {
    try {
      Database db = await DatabaseHelper.instance.database;
      return await db.insert('cards', Map.from(card.map));
    } catch (e) {
      print(e);
      return null;
    }
  }
}

class CategoryDB {
  CategoryDB();
  get createTable =>
      "CREATE TABLE categories(id INTEGER PRIMARY KEY,name TEXT NOT NULL,color TEXT NOT NULL);";
  Future<List> getCategories() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> list = await db.query('categories');
    List<CategoryModel> l = list.map((e) => CategoryModel.fromMap(e)).toList();
    return l;
  }
}

class UserDB {
  UserDB();
  Future<int> registerUser(UserModel user) async {
    try {
      Database db = await DatabaseHelper.instance.database;

      return await db.insert('users', user.map);
    } catch (e) {
      return null;
    }
  }

  get createTable =>
      "CREATE TABLE users(id INTEGER PRIMARY KEY, name TEXT NOT NULL,email TEXT NOT NULL UNIQUE,password TEXT NOT NULL,pin INT);";
  Future<UserModel> getUserWithEmailAndPassword(
      String email, String password) async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> list = await db.query('users',
        where: 'email = ? and password = ? ', whereArgs: [email, password]);
    return list.length > 0 ? UserModel.fromMap(list.first) : null;
  }

  Future<int> addPIN(int pin, int id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db
        .rawUpdate('UPDATE users SET pin = ? WHERE id = ?', [pin, id]);
  }

  Future<int> updateUser(Map<String, dynamic> row) async {
    Database db = await DatabaseHelper.instance.database;
    return await db
        .update('users', row, where: 'id =?', whereArgs: [row['id']]);
  }

  Future<int> deleteUser(int id) async {
    Database db = await DatabaseHelper.instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}

class PaymentDB {
  PaymentDB();
  get createTable =>
      "CREATE TABLE payments(id INTEGER PRIMARY KEY,name TEXT NOT NULL,category_id INTEGER NOT NULL,date TEXT NOT NULL,value REAL);";
}
