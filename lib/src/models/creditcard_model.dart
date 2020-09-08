import 'package:flutter/material.dart';
import 'package:minhasconta/src/utils/converting_util.dart';
import 'package:mobx/mobx.dart';

import 'payment_model.dart';
part 'creditcard_model.g.dart';

class CreditCardModel = _CreditCardModelBase with _$CreditCardModel;

abstract class _CreditCardModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  Color color;
  @observable
  double limit = 0;
  @observable
  ObservableList payments = [].asObservable();
  _CreditCardModelBase(
      {this.id, this.name, this.color = Colors.white, this.payments});
  @computed
  double get totalPayments {
    double total = 0;
    payments.forEach((element) {
      total = total + element.value;
    });
    return total;
  }

  @computed
  String get actualTotalLimit =>
      totalPayments.toString() + ' de ' + limit.toString();
  @computed
  List<PaymentsOfDay> get paymentsPerDate {
    Converting converting = Converting();
    List<PaymentsOfDay> paymentsOfDays = [];
    List<PaymentModel> paymentsActual = [];
    DateTime actual = DateTime.now();

    List paymentsSorted = payments;
    paymentsSorted.sort((a, b) => converting
        .dateToString(a.date)
        .compareTo(converting.dateToString(b.date)));
    paymentsSorted = paymentsSorted.reversed.toList();
    paymentsSorted.forEach((element) {
      print(converting.dateToString(element.date) + ' ' + element.name);
    });

    paymentsSorted.forEach((element) {
      if (converting.dateToString(element.date) ==
          converting.dateToString(actual)) {
        paymentsActual.add(element);
        print(element.name);
      } else {
        paymentsOfDays
            .add(PaymentsOfDay(date: actual, payments: paymentsActual));
        actual = element.date;
        paymentsActual = [];
        paymentsActual.add(element);
      }
    });

    paymentsOfDays.add(PaymentsOfDay(date: actual, payments: paymentsActual));
    return paymentsOfDays;
  }
}

class PaymentsOfDay {
  DateTime date;
  List<PaymentModel> payments = [];
  PaymentsOfDay({this.date, this.payments});
}
