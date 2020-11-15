import 'package:minhasconta/src/models/card_model.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

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
