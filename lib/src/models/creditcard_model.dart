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
  double get totalThisMonth {
    DateTime d = DateTime.now();
    double total = 0.0;
    payments.forEach((e) {
      if (d.month == e.date.month && d.year == e.date.year)
        return total = total + e.value;
    });
    return total;
  }

  @computed
  List<PaymentsOfDay> get paymentsPerDate {
    Converting c = Converting();
    List<PaymentsOfDay> pOfDays = [];
    List<PaymentModel> pActual = [];
    DateTime actual = DateTime.now();

    List pSorted = payments;
    pSorted.sort(
        (a, b) => c.dateToString(a.date).compareTo(c.dateToString(b.date)));
    pSorted = pSorted.reversed.toList();
    pSorted.forEach((element) {
      print(c.dateToString(element.date) + ' ' + element.name);
    });

    pSorted.forEach((element) {
      if (c.dateToString(element.date) == c.dateToString(actual)) {
        pActual.add(element);
        print(element.name);
      } else {
        if (pActual.length != 0)
          pOfDays.add(PaymentsOfDay(date: actual, payments: pActual));
        actual = element.date;
        pActual = [];
        pActual.add(element);
      }
    });

    pOfDays.add(PaymentsOfDay(date: actual, payments: pActual));
    return pOfDays;
  }
}

class PaymentsOfDay {
  DateTime date;
  List<PaymentModel> payments = [];
  PaymentsOfDay({this.date, this.payments});
}
