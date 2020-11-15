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
  Computed<String> _$dateBrComputed;

  @override
  String get dateBr =>
      (_$dateBrComputed ??= Computed<String>(() => super.dateBr,
              name: '_PaymentModelBase.dateBr'))
          .value;
  Computed<String> _$timeToStringComputed;

  @override
  String get timeToString =>
      (_$timeToStringComputed ??= Computed<String>(() => super.timeToString,
              name: '_PaymentModelBase.timeToString'))
          .value;
  Computed<Map<dynamic, dynamic>> _$mapComputed;

  @override
  Map<dynamic, dynamic> get map =>
      (_$mapComputed ??= Computed<Map<dynamic, dynamic>>(() => super.map,
              name: '_PaymentModelBase.map'))
          .value;
  Computed<bool> _$isTodayComputed;

  @override
  bool get isToday => (_$isTodayComputed ??= Computed<bool>(() => super.isToday,
          name: '_PaymentModelBase.isToday'))
      .value;
  Computed<bool> _$nameIsValidComputed;

  @override
  bool get nameIsValid =>
      (_$nameIsValidComputed ??= Computed<bool>(() => super.nameIsValid,
              name: '_PaymentModelBase.nameIsValid'))
          .value;
  Computed<bool> _$dateIsValidComputed;

  @override
  bool get dateIsValid =>
      (_$dateIsValidComputed ??= Computed<bool>(() => super.dateIsValid,
              name: '_PaymentModelBase.dateIsValid'))
          .value;
  Computed<bool> _$valueIsValidComputed;

  @override
  bool get valueIsValid =>
      (_$valueIsValidComputed ??= Computed<bool>(() => super.valueIsValid,
              name: '_PaymentModelBase.valueIsValid'))
          .value;
  Computed<bool> _$cardIsValidComputed;

  @override
  bool get cardIsValid =>
      (_$cardIsValidComputed ??= Computed<bool>(() => super.cardIsValid,
              name: '_PaymentModelBase.cardIsValid'))
          .value;
  Computed<bool> _$amountIsValidComputed;

  @override
  bool get amountIsValid =>
      (_$amountIsValidComputed ??= Computed<bool>(() => super.amountIsValid,
              name: '_PaymentModelBase.amountIsValid'))
          .value;
  Computed<bool> _$timeIsValidComputed;

  @override
  bool get timeIsValid =>
      (_$timeIsValidComputed ??= Computed<bool>(() => super.timeIsValid,
              name: '_PaymentModelBase.timeIsValid'))
          .value;
  Computed<bool> _$typeIsValidComputed;

  @override
  bool get typeIsValid =>
      (_$typeIsValidComputed ??= Computed<bool>(() => super.typeIsValid,
              name: '_PaymentModelBase.typeIsValid'))
          .value;
  Computed<Duration> _$timeToDurationComputed;

  @override
  Duration get timeToDuration => (_$timeToDurationComputed ??=
          Computed<Duration>(() => super.timeToDuration,
              name: '_PaymentModelBase.timeToDuration'))
      .value;
  Computed<bool> _$isAllValidWithCardComputed;

  @override
  bool get isAllValidWithCard => (_$isAllValidWithCardComputed ??=
          Computed<bool>(() => super.isAllValidWithCard,
              name: '_PaymentModelBase.isAllValidWithCard'))
      .value;
  Computed<String> _$isNotValidWithCardComputed;

  @override
  String get isNotValidWithCard => (_$isNotValidWithCardComputed ??=
          Computed<String>(() => super.isNotValidWithCard,
              name: '_PaymentModelBase.isNotValidWithCard'))
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

  final _$amountAtom = Atom(name: '_PaymentModelBase.amount');

  @override
  int get amount {
    _$amountAtom.reportRead();
    return super.amount;
  }

  @override
  set amount(int value) {
    _$amountAtom.reportWrite(value, super.amount, () {
      super.amount = value;
    });
  }

  final _$cardIdAtom = Atom(name: '_PaymentModelBase.cardId');

  @override
  int get cardId {
    _$cardIdAtom.reportRead();
    return super.cardId;
  }

  @override
  set cardId(int value) {
    _$cardIdAtom.reportWrite(value, super.cardId, () {
      super.cardId = value;
    });
  }

  final _$typeAtom = Atom(name: '_PaymentModelBase.type');

  @override
  PaymentTypeModel get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(PaymentTypeModel value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$typePriceAtom = Atom(name: '_PaymentModelBase.typePrice');

  @override
  bool get typePrice {
    _$typePriceAtom.reportRead();
    return super.typePrice;
  }

  @override
  set typePrice(bool value) {
    _$typePriceAtom.reportWrite(value, super.typePrice, () {
      super.typePrice = value;
    });
  }

  final _$nameEditAtom = Atom(name: '_PaymentModelBase.nameEdit');

  @override
  TextEditingController get nameEdit {
    _$nameEditAtom.reportRead();
    return super.nameEdit;
  }

  @override
  set nameEdit(TextEditingController value) {
    _$nameEditAtom.reportWrite(value, super.nameEdit, () {
      super.nameEdit = value;
    });
  }

  final _$amountEditAtom = Atom(name: '_PaymentModelBase.amountEdit');

  @override
  TextEditingController get amountEdit {
    _$amountEditAtom.reportRead();
    return super.amountEdit;
  }

  @override
  set amountEdit(TextEditingController value) {
    _$amountEditAtom.reportWrite(value, super.amountEdit, () {
      super.amountEdit = value;
    });
  }

  final _$valueEditAtom = Atom(name: '_PaymentModelBase.valueEdit');

  @override
  TextEditingController get valueEdit {
    _$valueEditAtom.reportRead();
    return super.valueEdit;
  }

  @override
  set valueEdit(TextEditingController value) {
    _$valueEditAtom.reportWrite(value, super.valueEdit, () {
      super.valueEdit = value;
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
  dynamic checkInfos() {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.checkInfos');
    try {
      return super.checkInfos();
    } finally {
      _$_PaymentModelBaseActionController.endAction(_$actionInfo);
    }
  }

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
  dynamic changeAmount(int a) {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeAmount');
    try {
      return super.changeAmount(a);
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
  dynamic changeTypePayment(PaymentTypeModel t) {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeTypePayment');
    try {
      return super.changeTypePayment(t);
    } finally {
      _$_PaymentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTypePrice(bool t) {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeTypePrice');
    try {
      return super.changeTypePrice(t);
    } finally {
      _$_PaymentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCardId(int i) {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeCardId');
    try {
      return super.changeCardId(i);
    } finally {
      _$_PaymentModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeToToday() {
    final _$actionInfo = _$_PaymentModelBaseActionController.startAction(
        name: '_PaymentModelBase.changeToToday');
    try {
      return super.changeToToday();
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
amount: ${amount},
cardId: ${cardId},
type: ${type},
typePrice: ${typePrice},
nameEdit: ${nameEdit},
amountEdit: ${amountEdit},
valueEdit: ${valueEdit},
category: ${category},
dateToString: ${dateToString},
dateBr: ${dateBr},
timeToString: ${timeToString},
map: ${map},
isToday: ${isToday},
nameIsValid: ${nameIsValid},
dateIsValid: ${dateIsValid},
valueIsValid: ${valueIsValid},
cardIsValid: ${cardIsValid},
amountIsValid: ${amountIsValid},
timeIsValid: ${timeIsValid},
typeIsValid: ${typeIsValid},
timeToDuration: ${timeToDuration},
isAllValidWithCard: ${isAllValidWithCard},
isNotValidWithCard: ${isNotValidWithCard}
    ''';
  }
}
