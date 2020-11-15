import 'package:minhasconta/src/models/payment_model.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

class PaymentDB {
  PaymentDB();
  get createTable =>
      "CREATE TABLE payments(id INTEGER PRIMARY KEY,name TEXT NOT NULL,category_id INTEGER NOT NULL,card_id INTEGER NOT NULL,date TEXT NOT NULL,value REAL,type_price INTEGER,amount INTEGER,type_id INTEGER NOT NULL,FOREIGN KEY(type_id) REFERENCES payment_types);";

  Future<int> registerPayment(Map map) async {
    try {
      Database db = await DatabaseHelper.instance.database;
      return await db.insert('payments', map);
    } catch (e) {
      return null;
    }
  }

  Future<List<PaymentModel>> getPaymentsOfMonth({int id, String month}) async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> list = await db.query('payments',
        where: 'card_id = ? and strftime("%m",date) = ?',
        whereArgs: [id, month]);
    return list.map((e) => PaymentModel.fromMap(e)).toList();
  }
}
