import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';
import 'package:mobx/mobx.dart';
part 'creditcard_controller.g.dart';

class CreditCardController = _CreditCardControllerBase
    with _$CreditCardController;

abstract class _CreditCardControllerBase with Store {
  @observable
  Widget actualWidget;
  @observable
  CreditCardModel creditCard = CreditCardModel();
  _CreditCardControllerBase({this.actualWidget, this.creditCard});
  @action
  changeActualWidget(Widget widget) => actualWidget = widget;
  @computed
  List get listPayments {
    List list = creditCard.payments;
    list.sort((a, b) => a.date.compareTo(b.date));
    return list;
  }
}
