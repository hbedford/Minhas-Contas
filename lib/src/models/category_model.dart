import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'category_model.g.dart';

class CategoryModel = _CategoryModelBase with _$CategoryModel;

abstract class _CategoryModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  ObservableList payments = [].asObservable();
  @observable
  Color color;
  @observable
  double percent;
  @observable
  ObservableList subCategories = [].asObservable();
  _CategoryModelBase(
      {this.id, this.name, this.payments, this.color, this.percent = 0.0});
  _CategoryModelBase.fromMap(Map m)
      : this.name = m['name'],
        this.id = m['id'],
        this.color = Color(int.parse(m['color']));
  @action
  addSubCategory(CategoryModel c) => subCategories.add(c);
  @action
  changeColor(Color c) {
    color = c;
    print(color.value.toString());
  }

  @action
  changePercent(double p) => percent = p;
  @action
  changeName(String n) => name = n;
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

  @computed
  Map<String, dynamic> get registerToMapCategory => {
        'name': name,
        'color': color.value.toString(),
      };
  @computed
  Map<String, dynamic> get registerToMapSubCategory => {
        'name': name,
        'color': color.value.toString(),
      };
}
