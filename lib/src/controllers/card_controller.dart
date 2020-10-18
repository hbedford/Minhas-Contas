import 'package:mobx/mobx.dart';
part 'card_controller.g.dart';

class CardController = _CardControllerBase with _$CardController;

abstract class _CardControllerBase with Store {
  @observable
  int actualWidget;
  _CardControllerBase({this.actualWidget});
  @action
  changeActualWidget(int widget) => actualWidget = widget;
}
