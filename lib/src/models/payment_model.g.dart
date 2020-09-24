// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentModel on _PaymentModelBase, Store {
  Computed<String> _$dateToStringComputed;

  @override
  String get dateToString =>
      (_$dateToStringComputed ??= Computed<String>(() => super.dateToString,
              name: '_PaymentModelBase.dateToString'))
          .value;

  final _$idAtom = Atom(name: '_PaymentModelBase.id');

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

  final _$nameAtom = Atom(name: '_PaymentModelBase.name');

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

  final _$valueAtom = Atom(name: '_PaymentModelBase.value');

  @override
  double get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(double value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$dateAtom = Atom(name: '_PaymentModelBase.date');

  @override
  DateTime get date {
    _$dateAtom.reportRead();
    return super.date;
  }

  @override
  set date(DateTime value) {
    _$dateAtom.reportWrite(value, super.date, () {
      super.date = value;
    });
  }

  final _$timeAtom = Atom(name: '_PaymentModelBase.time');

  @override
  TimeOfDay get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(TimeOfDay value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  final _$tPaymentAtom = Atom(name: '_PaymentModelBase.tPayment');

  @override
  int get tPayment {
    _$tPaymentAtom.reportRead();
    return super.tPayment;
  }

  @override
  set tPayment(int value) {
    _$tPaymentAtom.reportWrite(value, super.tPayment, () {
      super.tPayment = value;
    });
  }

  final _$categoryAtom = Atom(name: '_PaymentModelBase.category');

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

  final _$_PaymentModelBaseActionController =
      ActionController(name: '_PaymentModelBase');

  @override
  dynamic changeName(String n) {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeName');
    try {
      return super.changeName(n);
    } finally {
      _$_PaymentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValue(double v) {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeValue');
    try {
      return super.changeValue(v);
    } finally {
      _$_PaymentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDate(DateTime d) {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeDate');
    try {
      return super.changeDate(d);
    } finally {
      _$_PaymentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTime(TimeOfDay t) {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeTime');
    try {
      return super.changeTime(t);
    } finally {
      _$_PaymentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTypePayment(int t) {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeTypePayment');
    try {
      return super.changeTypePayment(t);
    } finally {
      _$_PaymentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
value: ${value},
date: ${date},
time: ${time},
tPayment: ${tPayment},
category: ${category},
dateToString: ${dateToString}
    ''';
  }
}
