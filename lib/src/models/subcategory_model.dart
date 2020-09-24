import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'subcategory_model.g.dart';

class SubCategoryModel = _SubCategoryModelBase with _$SubCategoryModel;

abstract class _SubCategoryModelBase with Store {
  @observable
  String name;
  @observable
  Color color;
  _SubCategoryModelBase({this.name, this.color});
  @action
  changeName(String n) => name = n;
  @action
  changeColor(Color c) => color = c;
}
