import 'package:minhasconta/src/models/payment_model.dart';
import 'package:mobx/mobx.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

class PaymentDB {
  PaymentDB();
  get createTable =>
      "CREATE TABLE payments(id INTEGER PRIMARY KEY,name TEXT NOT NULL,category_id INTEGER ,card_id INTEGER NOT NULL,date TEXT NOT NULL,time TEXT NOT NULL,value REAL,type_price INTEGER,amount INTEGER,type_id INTEGER NOT NULL,FOREIGN KEY(type_id) REFERENCES payment_types);";

  Future<int> registerPayment(Map map) async {
    try {
      Database db = await DatabaseHelper.instance.database;
      int i = await db.insert('payments', Map.from(map));
      print(i.toString() + 'a');
      return i;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<PaymentModel>> getPayments({int cardId}) async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> list =
        await db.query('payments', where: 'card_id = ?', whereArgs: [cardId]);
    return list.map((e) => PaymentModel.fromMap(e)).toList();
  }

  Future<List<PaymentModel>> getPaymentsOfMonth({int id, String month}) async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> list = await db.query('payments',
        where: "card_id = ? and strftime('%m',date) = ?",
        whereArgs: [id, month]);
    return list.map((e) => PaymentModel.fromMap(e)).toList();
  }

  Future<List<PaymentModel>> getPaymentsOfDays({String day, int id}) async {
    Database db = await DatabaseHelper.instance.database;

    List<Map> list = await db.query('payments',
        where: "card_id = ? and date('now') and date(?)", whereArgs: [id, day]);
    list.forEach((element) {
      print(element);
    });
    return ObservableList.of(list.map((e) => PaymentModel.fromMap(e)).toList());
  }
}
