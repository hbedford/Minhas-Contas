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
  bool tPayment;
  @observable
  CategoryModel category = CategoryModel(name: '', color: Colors.red);
  _PaymentModelBase(
      {this.id,
      this.name = '',
      this.category,
      this.date,
      this.value = 0,
      this.tPayment = false});

  @computed
  String get dateToString => Converting().dateToString(date);
}
