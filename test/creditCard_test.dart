import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhasconta/src/controllers/creditcards_controller.dart';
import 'package:minhasconta/src/models/category_model.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';
import 'package:minhasconta/src/models/payment_model.dart';
import 'package:mobx/mobx.dart';

main() {
  final c = CreditCardsController(
    creditCard: CreditCardModel(
      id: 1,
      name: 'Teste',
      color: Colors.white,
      payments: ObservableList.of(
        [
          PaymentModel(
              category: CategoryModel(color: Colors.green, name: 'Mercado'),
              name: 'Compras do churrasco de final de semana',
              date: DateTime.utc(2020, 09, 11),
              value: 200.0),
          PaymentModel(
              category: CategoryModel(color: Colors.green, name: 'Mercado'),
              name: 'Compras da semana',
              date: DateTime.utc(2020, 09, 06),
              value: 250.0),
          PaymentModel(
              category: CategoryModel(color: Colors.green, name: 'Mercado'),
              name: 'Compras do mes',
              date: DateTime.utc(2020, 09, 09),
              value: 200.0),
          PaymentModel(
              category: CategoryModel(color: Colors.green, name: 'Alimentação'),
              name: 'McDonald',
              date: DateTime.utc(2020, 09, 05),
              value: 200.0),
          PaymentModel(
              category: CategoryModel(color: Colors.green, name: 'Alimentação'),
              name: 'BurguerKing',
              date: DateTime.utc(2020, 09, 05),
              value: 10.0),
          PaymentModel(
              category: CategoryModel(color: Colors.green, name: 'Alimentação'),
              name: 'Bobs',
              date: DateTime.utc(2020, 09, 07),
              value: 203.0),
          PaymentModel(
              category: CategoryModel(color: Colors.green, name: 'Eletronicos'),
              name: 'iphone',
              date: DateTime.utc(2020, 09, 07),
              value: 203.0),
        ],
      ),
    ),
  );
  test('Testando pagamentos por data', () {
    c.creditCard.paymentsPerDate.forEach((element) {
      print(element.dateToString;
    });
  });
}
