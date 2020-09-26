import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/category_model.dart';
import 'package:minhasconta/src/utils/converting_util.dart';
import 'package:mobx/mobx.dart';

import 'cardtype_model.dart';
import 'payment_model.dart';
import 'paymentsofday_model.dart';
part 'creditcard_model.g.dart';

class CreditCardModel = _CreditCardModelBase with _$CreditCardModel;

abstract class _CreditCardModelBase with Store {
  Converting c = Converting();
  @observable
  int id;
  @observable
  String name;
  @observable
  Color color;
  @observable
  double limit = 0;
  @observable
  DateTime validate;
  @observable
  DateTime dueDate;
  @observable
  int last4Digits;
  @observable
  String mark;
  @observable
  String company;
  @observable
  CardTypeModel type;
  @observable
  DateTime bestDateToPay;
  @observable
  bool active = false;
  @observable
  bool optionsActive;

  @observable
  ObservableList payments = [].asObservable();
  _CreditCardModelBase(
      {this.id,
      this.name,
      this.color = Colors.white,
      this.payments,
      this.active = false,
      this.optionsActive = false});
  @action
  changeName(String n) => name = n;
  @action
  changeColor(Color c) => color = c;
  @action
  changeLimit(double l) => limit = l;
  @action
  changeValidate(DateTime v) => validate = v;
  @action
  changeDueDate(DateTime d) => dueDate = d;
  @action
  changeLast4Digits(int l) => last4Digits = l;
  @action
  changeMark(String m) => mark = m;
  @action
  changeCompany(String c) => company = c;
  @action
  changeBestDateToPay(DateTime b) => bestDateToPay = b;
  @action
  addPayment(PaymentModel p) => payments.add(p);
  @action
  changeToActived() => active = true;
  @action
  changeToDeactived() => active = false;
  @action
  changeOptionsActive(bool v) => optionsActive = v;
  @computed
  double get totalOfPayments {
    double total = 0;
    payments.forEach((element) {
      total = total + element.value;
    });
    return total;
  }

  @computed
  String get actualTotalLimit =>
      totalOfPayments.toString() + ' de ' + limit.toString();
  @computed
  double get totalThisMonth {
    DateTime d = DateTime.now();
    double total = 0.0;
    payments.forEach((e) {
      if (d.month == e.date.month && d.year == e.date.year)
        total = total + e.value;
    });
    return total;
  }

  @computed
  List<PaymentModel> get pThisMonth {
    DateTime d = DateTime.now();
    List<PaymentModel> list = [];
    payments.forEach((e) {
      if (d.month == e.date.month && d.year == e.date.year) list.add(e);
    });
    return list;
  }

  @computed
  List<CategoryModel> get orderByCategory {
    List<CategoryModel> list = [];
    print(pThisMonth.length);
    for (PaymentModel e in pThisMonth) {
      if (list.firstWhere((element) => element.name == e.category.name,
              orElse: () => null) !=
          null) {
        int i = list.indexWhere((element) => element.name == e.category.name);
        list[i].payments.add(e);
      } else {
        list.add(CategoryModel(
            color: e.category.color,
            name: e.category.name,
            payments: [e].asObservable()));
      }
    }
    return list;
  }

  /* @computed
  List<CategoryModel> get orderByCategory {
    List<CategoryModel> list = [];
    print(pThisMonth.length);
    for (PaymentModel element in pThisMonth) {
      print(element.name);
      if (list.length != 0 &&
          list.firstWhere((e) => e.name == element.name) != null) {
        print('b');
        int i = list.indexWhere((e) => element.category.name == e.name);
        list[i].payments.add(element);
      } else {
        print('c');
        list.add(CategoryModel(
            name: element.category.name,
            color: element.category.color,
            payments: [element].asObservable()));
      }
    }
    pThisMonth.forEach((element) {
      print(list.length != 0 &&
          list.firstWhere((e) => e.name == element.name) != null);
      if (list.length != 0 &&
          list.firstWhere((e) => e.name == element.name) != null) {
        print('b');
        int i = list.indexWhere((e) => element.category.name == e.name);
        return list[i].payments.add(element);
      } else {
        print('c');
        return list.add(CategoryModel(
            name: element.category.name,
            color: element.category.color,
            payments: [element].asObservable()));
      }
    });
    list.sort((a, b) => a.total.compareTo(b.total));
    list.forEach((element) {
      print(element.name + ' ' + element.total.toString());
    });
    return list;
  } */

  @computed
  List get pSortedPayments {
    List list = [];
    payments.forEach((element) {
      list.add(element);
    });
    list.sort(
        (a, b) => c.dateToString(b.date).compareTo(c.dateToString(a.date)));
    return list;
  }

  @computed
  List<PaymentsOfDay> get paymentsPerDate {
    List<PaymentsOfDay> pOfDays = [];
    List<PaymentModel> pActual = [];
    DateTime actual = DateTime.now();

    pSortedPayments.forEach((element) {
      if (c.dateToString(element.date) == c.dateToString(actual)) {
        pActual.add(element);
      } else {
        pOfDays
            .add(PaymentsOfDay(date: actual, payments: pActual.asObservable()));
        /* if (pActual.length != 0) */
        pActual.add(element);
        actual = element.date;
      }
    });
    pOfDays.add(PaymentsOfDay(date: actual, payments: pActual.asObservable()));

    return pOfDays;
  }

  @computed
  int get amountPaymentsThisMonth {
    int amount = 0;
    pThisMonth.forEach((element) {
      amount++;
    });
    return amount;
  }
}
