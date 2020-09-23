import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'category_model.g.dart';

class CategoryModel = _CategoryModelBase with _$CategoryModel;

abstract class _CategoryModelBase with Store {
  @observable
  String name;
  @observable
  ObservableList payments = [].asObservable();
  @observable
  bool type;
  @observable
  int step;
  @observable
  Color color;
  @observable
  ObservableList subCategories = [].asObservable();
  _CategoryModelBase(
      {this.name, this.payments, this.color, this.type = false, this.step = 0});
  @action
  addSubCategory(CategoryModel c) => subCategories.add(c);
  @action
  changeType(bool v) => type = v;
  @action
  selectType(bool v) {
    step = 1;
    changeType(v);
  }

  @action
  removeSubCategory(CategoryModel c) => subCategories.remove(c);
  @computed
  double get total {
    double t = 0;
    payments.forEach((e) {
      t = t + e.value;
    });
    return t;
  }
}
