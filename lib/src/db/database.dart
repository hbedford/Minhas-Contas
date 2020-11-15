import 'dart:io';

import 'package:minhasconta/src/db/models/payment_types_db_model.dart';
import 'package:minhasconta/src/models/category_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'models/card_db_model.dart';
import 'models/category_db_model.dart';
import 'models/payment_db_model.dart';
import 'models/user_db_model.dart';

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
    await db.execute(PaymentTypesDB().createTable);
    await db.execute(PaymentTypesDB().types());
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
