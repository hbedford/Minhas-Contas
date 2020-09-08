import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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
  ObservableList categories = [].asObservable();
  _PaymentModelBase(
      {this.id,
      this.name = '',
      this.categories,
      this.date,
      this.value,
      this.tPayment = false});
}
