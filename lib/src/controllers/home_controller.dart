import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  bool actionButton;
  _HomeControllerBase({this.actionButton = false});
  @action
  changeAButton(bool v) => actionButton = v;
}
