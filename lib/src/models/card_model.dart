import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/payments_controller.dart';
import 'package:minhasconta/src/controllers/user_controller.dart';
import 'package:minhasconta/src/db/models/payment_db_model.dart';
import 'package:minhasconta/src/models/payment_model.dart';
import 'package:minhasconta/src/models/payment_type_model.dart';
import 'package:minhasconta/src/models/paymentsofday_model.dart';
import 'package:minhasconta/src/utils/converting_util.dart';
import 'package:mobx/mobx.dart';

import 'category_model.dart';
part 'card_model.g.dart';

class CardModel = _CardModelBase with _$CardModel;

abstract class _CardModelBase with Store {
  Converting c = Converting();
  @observable
  int id;
  @observable
  String name;
  @observable
  String number;
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
  DateTime bestDateToPay;
  @observable
  bool active = false;
  @observable
  bool optionsActive;
  @observable
  bool debit;
  @observable
  bool credit;
  @observable
  bool show;
  @observable
  bool removeOption;
  @observable
  double balance;

  @observable
  ObservableList<PaymentModel> payments = ObservableList<PaymentModel>();
  _CardModelBase(
      {this.id,
      this.name,
      this.color = Colors.white,
      this.payments,
      this.active = false,
      this.optionsActive = false,
      this.show = false,
      this.debit = false,
      this.removeOption = false,
      this.balance = 0.0,
      this.credit = false,
      this.limit = 0.0,
      this.number = "0000000000000000"});

  // ignore: unused_element
  _CardModelBase.addNew()
      : this.color = Colors.white,
        this.removeOption = false,
        this.show = false;
  _CardModelBase.emptyCard()
      : this.name = '',
        this.color = Color(0xFF222059),
        this.show = false,
        this.number = "0000000000000000",
        this.credit = false,
        this.removeOption = false,
        this.debit = false,
        this.balance = 0.0,
        this.limit = 0.0;
  _CardModelBase.fromMap(Map e) {
    this.id = e['id'];
    this.name = e['name'];
    this.number = e['number'];
    this.limit = e['limitcard'];
    this.balance = e['balance'];
    this.show = true;
    this.removeOption = false;
    this.payments = ObservableList.of([]);
    this.credit = e['credit'] == 0 ? false : true;
    this.debit = e['debit'] == 0 ? false : true;
    this.color = Color(e['color']);
  }
  @action
  changeId(int i) => id = i;
  @action
  changeName(String n) => name = n;
  @action
  changeBalance(double b) => balance = b;
  @action
  changeNumber(String n) => number = n;
  @action
  changeColor(Color c) => color = c;
  @action
  changeLimit(double l) => limit = l;
  @action
  changeValidate(DateTime v) => validate = v;
  @action
  changeDueDate(DateTime d) => dueDate = d;
  @action
  changeShow(bool s) => show = s;
  @action
  changeCheckRemove(bool c) => removeOption = c;
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
  changeDebit(bool d) => debit = d;
  @action
  changeCredit(bool c) => credit = c;
  @action
  changePayments(ObservableList<PaymentModel> l) => payments = l;
  @action
  changeOptionsActive(bool v) => optionsActive = v;
  @computed
  double get totalOfPayments {
    double total = 0;
    if (pThisMonth != null)
      pThisMonth.forEach((element) {
        if (element.type.id == 2) total = total + element.value;
      });
    return total;
  }

  @computed
  bool get creditDebitIsValid =>
      debit && !credit || debit && credit || !debit && credit;
  @computed
  bool get onlyDebitOrCredit => debit && !credit || !debit && credit;
  @computed
  bool get debitAndCredit => debit && credit;
  @computed
  String get actualTotalLimit =>
      'R\$ ' + totalOfPayments.toStringAsFixed(2).replaceAll('.', ',');
  @computed
  String get limitDisponible {
    return (limit - totalThisMonthCredit)
        .toStringAsFixed(2)
        .replaceAll('.', ',');
  }

  @computed
  double get totalThisMonthCredit {
    DateTime d = DateTime.now();
    double total = 0.0;
    payments.forEach((e) {
      if (d.month == e.date.month && d.year == e.date.year && e.type.id == 2)
        total = total + e.value;
    });
    return total;
  }

  @computed
  Map<String, dynamic> get map {
    final c = GetIt.I.get<UserController>();
    return {
      'name': name,
      'number': number,
      'color': color.value,
      'limitcard': limit,
      'user_id': c.user.id,
      'balance': balance,
      'credit': (credit ?? false) ? 1 : 0,
      'debit': (debit ?? false) ? 1 : 0,
    };
  }

  @computed
  List<PaymentModel> get pThisMonth {
    DateTime d = DateTime.now();
    List<PaymentModel> list = [];
    if (payments != null)
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

  @computed
  String get number01 => number.length >= 4 ? number.substring(0, 4) : '0000';
  @computed
  String get number02 => number.length >= 8 ? number.substring(4, 8) : '0000';
  @computed
  String get number03 => number.length >= 12 ? number.substring(8, 12) : '0000';
  @computed
  String get number04 =>
      number.length >= 16 ? number.substring(12, 16) : '0000';
  @computed
  String get numbers =>
      number01 + ' ' + number02 + ' ' + number03 + ' ' + number04;
  @computed
  bool get isValidName => name != null && name.length > 0;
  @computed
  bool get isValidNumber => number != null && number.length == 16;
  @computed
  bool get isValidColor => color != null;
  @computed
  bool get isValidLimit => limit != null && limit > 0;
  @computed
  bool get isValidBalance => balance != 0;
  @computed
  bool get isAllValid =>
      isValidName &&
      isValidNumber &&
      isValidColor &&
      isValidLimit &&
      isValidBalance &&
      creditDebitIsValid;

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
    if (payments != null)
      payments.forEach((element) {
        list.add(element);
      });
    list.sort(
        (a, b) => c.dateToString(b.date).compareTo(c.dateToString(a.date)));
    return list;
  }

  @computed
  List<PaymentsOfDayModel> get paymentsPerDate {
    List<PaymentsOfDayModel> pOfDays = [];
    List<PaymentModel> pActual = [];
    DateTime actual = DateTime.now();

    pSortedPayments.forEach((element) {
      if (c.dateToString(element.date) == c.dateToString(actual)) {
        pActual.add(element);
      } else {
        pOfDays.add(
            PaymentsOfDayModel(date: actual, payments: pActual.asObservable()));
        /* if (pActual.length != 0) */
        pActual.add(element);
        actual = element.date;
      }
    });
    pOfDays.add(
        PaymentsOfDayModel(date: actual, payments: pActual.asObservable()));

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

  @computed
  String get invalidString {
    if (!isValidName)
      return 'Necessario inserir um nome';
    else if (!isValidColor)
      return 'Necessario selecionar uma cor';
    else if (!isValidLimit)
      return 'Necessario colocar um limite no cartão';
    else if (!isValidNumber)
      return 'Necessario um número de cartão';
    else if (!creditDebitIsValid)
      return 'Necessario selecionar pelo menos 1 opção, Debito ou Credito ou ambos';
    else
      return 'Algum erro ocorreu';
  }
}
