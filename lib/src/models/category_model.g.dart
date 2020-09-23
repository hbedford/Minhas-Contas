// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryModel on _CategoryModelBase, Store {
  Computed<double> _$totalComputed;

  @override
  double get total => (_$totalComputed ??=
          Computed<double>(() => super.total, name: '_CategoryModelBase.total'))
      .value;

  final _$nameAtom = Atom(name: '_CategoryModelBase.name');

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

  final _$paymentsAtom = Atom(name: '_CategoryModelBase.payments');

  @override
  ObservableList<dynamic> get payments {
    _$paymentsAtom.reportRead();
    return super.payments;
  }

  @override
  set payments(ObservableList<dynamic> value) {
    _$paymentsAtom.reportWrite(value, super.payments, () {
      super.payments = value;
    });
  }

  final _$typeAtom = Atom(name: '_CategoryModelBase.type');

  @override
  bool get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(bool value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$stepAtom = Atom(name: '_CategoryModelBase.step');

  @override
  int get step {
    _$stepAtom.reportRead();
    return super.step;
  }

  @override
  set step(int value) {
    _$stepAtom.reportWrite(value, super.step, () {
      super.step = value;
    });
  }

  final _$colorAtom = Atom(name: '_CategoryModelBase.color');

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

  final _$subCategoriesAtom = Atom(name: '_CategoryModelBase.subCategories');

  @override
  ObservableList<dynamic> get subCategories {
    _$subCategoriesAtom.reportRead();
    return super.subCategories;
  }

  @override
  set subCategories(ObservableList<dynamic> value) {
    _$subCategoriesAtom.reportWrite(value, super.subCategories, () {
      super.subCategories = value;
    });
  }

  final _$_CategoryModelBaseActionController =
      ActionController(name: '_CategoryModelBase');

  @override
  dynamic addSubCategory(CategoryModel c) {
    final _$actionInfo = _$_CategoryModelBaseActionController.startAction(
        name: '_CategoryModelBase.addSubCategory');
    try {
      return super.addSubCategory(c);
    } finally {
      _$_CategoryModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeType(bool v) {
    final _$actionInfo = _$_CategoryModelBaseActionController.startAction(
        name: '_CategoryModelBase.changeType');
    try {
      return super.changeType(v);
    } finally {
      _$_CategoryModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectType(bool v) {
    final _$actionInfo = _$_CategoryModelBaseActionController.startAction(
        name: '_CategoryModelBase.selectType');
    try {
      return super.selectType(v);
    } finally {
      _$_CategoryModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeSubCategory(CategoryModel c) {
    final _$actionInfo = _$_CategoryModelBaseActionController.startAction(
        name: '_CategoryModelBase.removeSubCategory');
    try {
      return super.removeSubCategory(c);
    } finally {
      _$_CategoryModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
payments: ${payments},
type: ${type},
step: ${step},
color: ${color},
subCategories: ${subCategories},
total: ${total}
    ''';
  }
}
