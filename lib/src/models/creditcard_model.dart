import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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
  _CreditCardModelBase({this.id, this.name, this.color = Colors.white});
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
}
