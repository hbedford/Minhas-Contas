import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/payment_type_model.dart';
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
  PaymentTypeModel type;
  //0 - credito / 1 - debito / 2 - dinheiro/transf
  @observable
  CategoryModel category = CategoryModel(name: '', color: Colors.red);
  _PaymentModelBase(
      {this.id,
      this.name = '',
      this.category,
      this.date,
      this.value = 0,
      this.type,
      this.cardId});
  _PaymentModelBase.fromMap(Map e)
      : this.id = e['id'],
        this.name = e['name'],
        this.date = DateTime.parse(e['date']);
  @action
  changeName(String n) => name = n;
  @action
  changeValue(double v) => value = v;
  @action
  changeDate(DateTime d) => date = d;
  @action
  changeTime(TimeOfDay t) => time = t;
  @action
  changeTypePayment(PaymentTypeModel t) => type = t;
  @action
  changeCardId(int i) => cardId = i;
  @action
  changeToToday() => date = DateTime.now();
  @computed
  String get dateToString => Converting().dateToString(date);
  @computed
  String get dateBr => Converting().dateDMYtoS(date);
  @computed
  String get timeToString => Converting().timeToString(time);
  @computed
  Map get map => {
        'id': id,
        'name': name,
        'date': dateToString,
        'value': value,
        'card_id': cardId,
        'time': timeToString,
        'type': type.id,
      };
  @computed
  bool get isToday => (date.compareTo(DateTime.now()) == 0);
}
