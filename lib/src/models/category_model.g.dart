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
  Computed<Map<String, dynamic>> _$registerToMapCategoryComputed;

  @override
  Map<String, dynamic> get registerToMapCategory =>
      (_$registerToMapCategoryComputed ??= Computed<Map<String, dynamic>>(
              () => super.registerToMapCategory,
              name: '_CategoryModelBase.registerToMapCategory'))
          .value;
  Computed<Map<String, dynamic>> _$registerToMapSubCategoryComputed;

  @override
  Map<String, dynamic> get registerToMapSubCategory =>
      (_$registerToMapSubCategoryComputed ??= Computed<Map<String, dynamic>>(
              () => super.registerToMapSubCategory,
              name: '_CategoryModelBase.registerToMapSubCategory'))
          .value;

  final _$idAtom = Atom(name: '_CategoryModelBase.id');

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

  final _$percentAtom = Atom(name: '_CategoryModelBase.percent');

  @override
  double get percent {
    _$percentAtom.reportRead();
    return super.percent;
  }

  @override
  set percent(double value) {
    _$percentAtom.reportWrite(value, super.percent, () {
      super.percent = value;
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
  dynamic changeColor(Color c) {
    final _$actionInfo = _$_CategoryModelBaseActionController.startAction(
        name: '_CategoryModelBase.changeColor');
    try {
      return super.changeColor(c);
    } finally {
      _$_CategoryModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePercent(double p) {
    final _$actionInfo = _$_CategoryModelBaseActionController.startAction(
        name: '_CategoryModelBase.changePercent');
    try {
      return super.changePercent(p);
    } finally {
      _$_CategoryModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String n) {
    final _$actionInfo = _$_CategoryModelBaseActionController.startAction(
        name: '_CategoryModelBase.changeName');
    try {
      return super.changeName(n);
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
id: ${id},
name: ${name},
payments: ${payments},
color: ${color},
percent: ${percent},
subCategories: ${subCategories},
total: ${total},
registerToMapCategory: ${registerToMapCategory},
registerToMapSubCategory: ${registerToMapSubCategory}
    ''';
  }
}
