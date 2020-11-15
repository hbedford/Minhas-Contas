import 'package:minhasconta/src/models/payment_type_model.dart';
import 'package:sqflite/sqflite.dart';

import '../database.dart';

class PaymentTypesDB {
  PaymentTypesDB();
  get createTable =>
      "CREATE TABLE payment_types(id INTEGER PRIMARY KEY, name TEXT NOT NULL);";
  get types => ['Debito', 'Credito', 'Transferencia'];

  Future<List<PaymentTypeModel>> getTypes() async {
    Database db = await DatabaseHelper.instance.database;
    List<Map> list = await db.query('payment_types');
    return list.map((e) => PaymentTypeModel.fromMap(e)).toList();
  }
}
