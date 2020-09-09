// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentModel on _PaymentModelBase, Store {
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
  bool get tPayment {
    _$tPaymentAtom.reportRead();
    return super.tPayment;
  }

  @override
  set tPayment(bool value) {
    _$tPaymentAtom.reportWrite(value, super.tPayment, () {
      super.tPayment = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_PaymentModelBase.categories');

  @override
  ObservableList<dynamic> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<dynamic> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
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
categories: ${categories}
    ''';
  }
}
