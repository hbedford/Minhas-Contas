import 'package:minhasconta/src/models/category_model.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

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
