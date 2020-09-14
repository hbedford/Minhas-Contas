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
  ObservableList expenses = [].asObservable();
  _ProjectModelBase(
      {this.id,
      this.name,
      this.color = Colors.white,
      this.description,
      this.initialDate,
      this.endDate,
      this.expenses,
      this.spendingExpectation,
      this.category});
  @action
  changeName(String n) => name = n;
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
  addExpense(PaymentModel p) => expenses.add(p);
}
