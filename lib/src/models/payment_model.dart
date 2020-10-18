import 'package:flutter/material.dart';
import 'package:minhasconta/src/utils/converting_util.dart';
import 'package:mobx/mobx.dart';

import 'category_model.dart';
part 'payment_model.g.dart';

class PaymentModel = _PaymentModelBase with _$PaymentModel;

abstract class _PaymentModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  double value;
  @observable
  DateTime date;
  @observable
  TimeOfDay time;
  @observable
  int cardId;
  @observable
  int tPayment;
  //0 - credito / 1 - debito / 2 - dinheiro/transf
  @observable
  CategoryModel category = CategoryModel(name: '', color: Colors.red);
  _PaymentModelBase(
      {this.id,
      this.name = '',
      this.category,
      this.date,
      this.value = 0,
      this.tPayment,
      this.cardId});
  @action
  changeName(String n) => name = n;
  @action
  changeValue(double v) => value = v;
  @action
  changeDate(DateTime d) => date = d;
  @action
  changeTime(TimeOfDay t) => time = t;
  @action
  changeTypePayment(int t) => tPayment = t;
  @action
  changeCardId(int i) => cardId = i;

  @computed
  String get dateToString => Converting().dateToString(date);
}
