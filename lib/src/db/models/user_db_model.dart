import 'package:minhasconta/src/models/user_model.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

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
