// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectModel on _ProjectModelBase, Store {
  final _$idAtom = Atom(name: '_ProjectModelBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$nameAtom = Atom(name: '_ProjectModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_ProjectModelBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$initialDateAtom = Atom(name: '_ProjectModelBase.initialDate');

  @override
  DateTime get initialDate {
    _$initialDateAtom.reportRead();
    return super.initialDate;
  }

  @override
  set initialDate(DateTime value) {
    _$initialDateAtom.reportWrite(value, super.initialDate, () {
      super.initialDate = value;
    });
  }

  final _$endDateAtom = Atom(name: '_ProjectModelBase.endDate');

  @override
  DateTime get endDate {
    _$endDateAtom.reportRead();
    return super.endDate;
  }

  @override
  set endDate(DateTime value) {
    _$endDateAtom.reportWrite(value, super.endDate, () {
      super.endDate = value;
    });
  }

  final _$spendingExpectationAtom =
      Atom(name: '_ProjectModelBase.spendingExpectation');

  @override
  double get spendingExpectation {
    _$spendingExpectationAtom.reportRead();
    return super.spendingExpectation;
  }

  @override
  set spendingExpectation(double value) {
    _$spendingExpectationAtom.reportWrite(value, super.spendingExpectation, () {
      super.spendingExpectation = value;
    });
  }

  final _$colorAtom = Atom(name: '_ProjectModelBase.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$categoryAtom = Atom(name: '_ProjectModelBase.category');

  @override
  CategoryModel get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(CategoryModel value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$expensesAtom = Atom(name: '_ProjectModelBase.expenses');

  @override
  ObservableList<dynamic> get expenses {
    _$expensesAtom.reportRead();
    return super.expenses;
  }

  @override
  set expenses(ObservableList<dynamic> value) {
    _$expensesAtom.reportWrite(value, super.expenses, () {
      super.expenses = value;
    });
  }

  final _$_ProjectModelBaseActionController =
      ActionController(name: '_ProjectModelBase');

  @override
  dynamic changeName(String n) {
    final _$actionInfo = _$_ProjectModelBaseActionController.startAction(
        name: '_ProjectModelBase.changeName');
    try {
      return super.changeName(n);
    } finally {
      _$_ProjectModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDescription(String d) {
    final _$actionInfo = _$_ProjectModelBaseActionController.startAction(
        name: '_ProjectModelBase.changeDescription');
    try {
      return super.changeDescription(d);
    } finally {
      _$_ProjectModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeInitialDate(DateTime d) {
    final _$actionInfo = _$_ProjectModelBaseActionController.startAction(
        name: '_ProjectModelBase.changeInitialDate');
    try {
      return super.changeInitialDate(d);
    } finally {
      _$_ProjectModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEndDate(DateTime d) {
    final _$actionInfo = _$_ProjectModelBaseActionController.startAction(
        name: '_ProjectModelBase.changeEndDate');
    try {
      return super.changeEndDate(d);
    } finally {
      _$_ProjectModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSpendingExpectation(double v) {
    final _$actionInfo = _$_ProjectModelBaseActionController.startAction(
        name: '_ProjectModelBase.changeSpendingExpectation');
    try {
      return super.changeSpendingExpectation(v);
    } finally {
      _$_ProjectModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeColor(Color c) {
    final _$actionInfo = _$_ProjectModelBaseActionController.startAction(
        name: '_ProjectModelBase.changeColor');
    try {
      return super.changeColor(c);
    } finally {
      _$_ProjectModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCategory(CategoryModel c) {
    final _$actionInfo = _$_ProjectModelBaseActionController.startAction(
        name: '_ProjectModelBase.changeCategory');
    try {
      return super.changeCategory(c);
    } finally {
      _$_ProjectModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addExpense(PaymentModel p) {
    final _$actionInfo = _$_ProjectModelBaseActionController.startAction(
        name: '_ProjectModelBase.addExpense');
    try {
      return super.addExpense(p);
    } finally {
      _$_ProjectModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
description: ${description},
initialDate: ${initialDate},
endDate: ${endDate},
spendingExpectation: ${spendingExpectation},
color: ${color},
category: ${category},
expenses: ${expenses}
    ''';
  }
}
