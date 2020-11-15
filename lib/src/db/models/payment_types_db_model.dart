class PaymentTypesDB {
  PaymentTypesDB();
  get createTable =>
      "CREATE TABLE payment_types(id INTEGER PRIMARY KEY, name TEXT NOT NULL);";
  String types() {
    return """
            INSERT INTO payment_types(name) values('Debito');
            INSERT INTO payment_types(name) values('Credito');
            INSERT INTO payment_types(name) values('Transferencia');
          """;
  }
}
