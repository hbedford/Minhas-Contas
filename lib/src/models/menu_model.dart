import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'menu_model.g.dart';

class MenuModel = _MenuModelBase with _$MenuModel;

abstract class _MenuModelBase with Store {
  @observable
  String name;
  @observable
  Icon icon;
  @observable
  int widget;
  _MenuModelBase({this.name, this.icon, this.widget});
  @action
  cW(int w) => widget = w;
}
