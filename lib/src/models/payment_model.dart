import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/controllers/payments_controller.dart';
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
  int amount;
  @observable
  int cardId;
  @observable
  PaymentTypeModel type;
  @observable
  bool typePrice;
  @observable
  TextEditingController nameEdit;
  @observable
  TextEditingController amountEdit;
  @observable
  TextEditingController valueEdit;
  //0 - credito / 1 - debito / 2 - dinheiro/transf
  @observable
  CategoryModel category = CategoryModel(name: '', color: Colors.red);
  _PaymentModelBase(
      {this.id,
      this.name = '',
      this.category,
      this.date,
      this.time,
      this.amountEdit,
      this.nameEdit,
      this.value = 0,
      this.valueEdit,
      this.amount = 0,
      this.typePrice = false,
      this.type,
      this.cardId});
  _PaymentModelBase.fromMap(Map e) {
    final c = GetIt.I.get<PaymentsController>();
    this.id = e['id'];
    this.name = e['name'];
    this.amount = e['amount'];
    this.cardId = e['card_id'];
    this.type = c.getTypeWithId(e['type_id']);
    this.typePrice = false;
    this.date = DateTime.parse(e['date']);
    this.value = e['value'];
  }
  @action
  checkInfos() {
    if (nameEdit.text.isNotEmpty) changeName(nameEdit.text);
    if (amountEdit.text.isNotEmpty) changeAmount(int.parse(amountEdit.text));
    if (valueEdit.text.isNotEmpty)
      changeValue(double.parse(valueEdit.text.replaceAll(',', '.')));
  }

  @action
  changeName(String n) => name = n;
  @action
  changeValue(double v) => value = v;
  @action
  changeAmount(int a) => amount = a;
  @action
  changeDate(DateTime d) => date = d;
  @action
  changeTime(TimeOfDay t) => time = t;
  @action
  changeTypePayment(PaymentTypeModel t) => type = t;
  @action
  changeTypePrice(bool t) => typePrice = t;
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
        /* 'time': timeToString, */
        'type_id': type.id,
        'amount': amount,
        'type_price': typePrice ? 1 : 0,
      };
  @computed
  bool get isToday => (date.compareTo(DateTime.now()) == 0);
  @computed
  bool get nameIsValid => name != null && name.length > 2;
  @computed
  bool get dateIsValid => date != null;
  @computed
  bool get valueIsValid => value != null && value > 0;
  @computed
  bool get cardIsValid => cardId != null;
  @computed
  bool get amountIsValid => amount != null && amount > 0;
  @computed
  bool get timeIsValid => time != null;
  @computed
  bool get typeIsValid => type != null;
  @computed
  Duration get timeToDuration =>
      Duration(hours: time.hour, minutes: time.minute);
  @computed
  bool get isAllValidWithCard =>
      nameIsValid &&
      amountIsValid &&
      dateIsValid &&
      valueIsValid &&
      cardIsValid &&
      timeIsValid &&
      typeIsValid;
  @computed
  String get isNotValidWithCard => !nameIsValid
      ? 'Necessario ter um nome para a despesa'
      : !amountIsValid
          ? 'Necessario uma quantidade'
          : !dateIsValid
              ? 'Necessario uma data'
              : !valueIsValid
                  ? 'Necessario um valor'
                  : !cardIsValid
                      ? 'Necessario um cartão'
                      : !timeIsValid
                          ? 'Necessario um horario'
                          : 'Necessario uma forma de pagamento';
}
