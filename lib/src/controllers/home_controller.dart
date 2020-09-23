import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  bool actionButton;
  @observable
  int index;
  _HomeControllerBase({this.actionButton = false, this.index = 0});
  @action
  changeAButton(bool v) => actionButton = v;
  @action
  changeIndex(int i) => index = i;
}
