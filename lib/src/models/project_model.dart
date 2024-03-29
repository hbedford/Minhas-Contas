import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/category_model.dart';
import 'package:minhasconta/src/models/payment_model.dart';
import 'package:mobx/mobx.dart';
part 'project_model.g.dart';

class ProjectModel = _ProjectModelBase with _$ProjectModel;

abstract class _ProjectModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  String description;
  @observable
  DateTime initialDate;
  @observable
  DateTime endDate;
  @observable
  double spendingExpectation;
  @observable
  Color color;
  @observable
  CategoryModel category;
  @observable
  ObservableList categories = [].asObservable();
  @observable
  ObservableList payments = [].asObservable();
  @observable
  Icon icon;
  @observable
  String image;
  @observable
  ObservableList expenses = [].asObservable();
  _ProjectModelBase(
      {this.id,
      this.name,
      this.color = Colors.white,
      this.description,
      this.initialDate,
      this.endDate,
      this.expenses,
      this.payments,
      this.icon,
      this.spendingExpectation,
      this.category,
      this.categories,
      this.image});
  @action
  changeName(String n) => name = n;
  @action
  changeImage(String i) => image = i;
  @action
  changeDescription(String d) => description = d;
  @action
  changeInitialDate(DateTime d) => initialDate = d;
  @action
  changeEndDate(DateTime d) => endDate = d;
  @action
  changeSpendingExpectation(double v) => spendingExpectation = v;
  @action
  changeColor(Color c) => color = c;
  @action
  changeCategory(CategoryModel c) => category = c;
  @action
  changeCategories(ObservableList l) => categories = l;
  @action
  addExpense(PaymentModel p) => expenses.add(p);
}
