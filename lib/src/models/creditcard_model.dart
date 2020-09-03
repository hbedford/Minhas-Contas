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
  _CreditCardModelBase({this.id, this.name, this.color = Colors.white});
}
