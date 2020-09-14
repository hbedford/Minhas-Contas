import 'package:mobx/mobx.dart';
part 'creditcard_controller.g.dart';

class CreditCardController = _CreditCardControllerBase
    with _$CreditCardController;

abstract class _CreditCardControllerBase with Store {
  @observable
  int actualWidget;
  _CreditCardControllerBase({this.actualWidget});
  @action
  changeActualWidget(int widget) => actualWidget = widget;
}
