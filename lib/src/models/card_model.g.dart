// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardModel on _CardModelBase, Store {
  Computed<double> _$totalOfPaymentsComputed;

  @override
  double get totalOfPayments => (_$totalOfPaymentsComputed ??= Computed<double>(
          () => super.totalOfPayments,
          name: '_CardModelBase.totalOfPayments'))
      .value;
  Computed<bool> _$creditDebitIsValidComputed;

  @override
  bool get creditDebitIsValid => (_$creditDebitIsValidComputed ??=
          Computed<bool>(() => super.creditDebitIsValid,
              name: '_CardModelBase.creditDebitIsValid'))
      .value;
  Computed<String> _$actualTotalLimitComputed;

  @override
  String get actualTotalLimit => (_$actualTotalLimitComputed ??=
          Computed<String>(() => super.actualTotalLimit,
              name: '_CardModelBase.actualTotalLimit'))
      .value;
  Computed<double> _$totalThisMonthComputed;

  @override
  double get totalThisMonth =>
      (_$totalThisMonthComputed ??= Computed<double>(() => super.totalThisMonth,
              name: '_CardModelBase.totalThisMonth'))
          .value;
  Computed<Map<String, dynamic>> _$mapComputed;

  @override
  Map<String, dynamic> get map =>
      (_$mapComputed ??= Computed<Map<String, dynamic>>(() => super.map,
              name: '_CardModelBase.map'))
          .value;
  Computed<List<PaymentModel>> _$pThisMonthComputed;

  @override
  List<PaymentModel> get pThisMonth => (_$pThisMonthComputed ??=
          Computed<List<PaymentModel>>(() => super.pThisMonth,
              name: '_CardModelBase.pThisMonth'))
      .value;
  Computed<List<CategoryModel>> _$orderByCategoryComputed;

  @override
  List<CategoryModel> get orderByCategory => (_$orderByCategoryComputed ??=
          Computed<List<CategoryModel>>(() => super.orderByCategory,
              name: '_CardModelBase.orderByCategory'))
      .value;
  Computed<String> _$number01Computed;

  @override
  String get number01 =>
      (_$number01Computed ??= Computed<String>(() => super.number01,
              name: '_CardModelBase.number01'))
          .value;
  Computed<String> _$number02Computed;

  @override
  String get number02 =>
      (_$number02Computed ??= Computed<String>(() => super.number02,
              name: '_CardModelBase.number02'))
          .value;
  Computed<String> _$number03Computed;

  @override
  String get number03 =>
      (_$number03Computed ??= Computed<String>(() => super.number03,
              name: '_CardModelBase.number03'))
          .value;
  Computed<String> _$number04Computed;

  @override
  String get number04 =>
      (_$number04Computed ??= Computed<String>(() => super.number04,
              name: '_CardModelBase.number04'))
          .value;
  Computed<String> _$numbersComputed;

  @override
  String get numbers => (_$numbersComputed ??=
          Computed<String>(() => super.numbers, name: '_CardModelBase.numbers'))
      .value;
  Computed<bool> _$isValidNameComputed;

  @override
  bool get isValidName =>
      (_$isValidNameComputed ??= Computed<bool>(() => super.isValidName,
              name: '_CardModelBase.isValidName'))
          .value;
  Computed<bool> _$isValidNumberComputed;

  @override
  bool get isValidNumber =>
      (_$isValidNumberComputed ??= Computed<bool>(() => super.isValidNumber,
              name: '_CardModelBase.isValidNumber'))
          .value;
  Computed<bool> _$isValidColorComputed;

  @override
  bool get isValidColor =>
      (_$isValidColorComputed ??= Computed<bool>(() => super.isValidColor,
              name: '_CardModelBase.isValidColor'))
          .value;
  Computed<bool> _$isValidLimitComputed;

  @override
  bool get isValidLimit =>
      (_$isValidLimitComputed ??= Computed<bool>(() => super.isValidLimit,
              name: '_CardModelBase.isValidLimit'))
          .value;
  Computed<bool> _$isAllValidComputed;

  @override
  bool get isAllValid =>
      (_$isAllValidComputed ??= Computed<bool>(() => super.isAllValid,
              name: '_CardModelBase.isAllValid'))
          .value;
  Computed<List<PaymentTypeModel>> _$typesComputed;

  @override
  List<PaymentTypeModel> get types =>
      (_$typesComputed ??= Computed<List<PaymentTypeModel>>(() => super.types,
              name: '_CardModelBase.types'))
          .value;
  Computed<List<dynamic>> _$pSortedPaymentsComputed;

  @override
  List<dynamic> get pSortedPayments => (_$pSortedPaymentsComputed ??=
          Computed<List<dynamic>>(() => super.pSortedPayments,
              name: '_CardModelBase.pSortedPayments'))
      .value;
  Computed<List<PaymentsOfDayModel>> _$paymentsPerDateComputed;

  @override
  List<PaymentsOfDayModel> get paymentsPerDate => (_$paymentsPerDateComputed ??=
          Computed<List<PaymentsOfDayModel>>(() => super.paymentsPerDate,
              name: '_CardModelBase.paymentsPerDate'))
      .value;
  Computed<int> _$amountPaymentsThisMonthComputed;

  @override
  int get amountPaymentsThisMonth => (_$amountPaymentsThisMonthComputed ??=
          Computed<int>(() => super.amountPaymentsThisMonth,
              name: '_CardModelBase.amountPaymentsThisMonth'))
      .value;
  Computed<String> _$invalidStringComputed;

  @override
  String get invalidString =>
      (_$invalidStringComputed ??= Computed<String>(() => super.invalidString,
              name: '_CardModelBase.invalidString'))
          .value;

  final _$idAtom = Atom(name: '_CardModelBase.id');

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

  final _$nameAtom = Atom(name: '_CardModelBase.name');

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

  final _$numberAtom = Atom(name: '_CardModelBase.number');

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  final _$colorAtom = Atom(name: '_CardModelBase.color');

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

  final _$limitAtom = Atom(name: '_CardModelBase.limit');

  @override
  double get limit {
    _$limitAtom.reportRead();
    return super.limit;
  }

  @override
  set limit(double value) {
    _$limitAtom.reportWrite(value, super.limit, () {
      super.limit = value;
    });
  }

  final _$validateAtom = Atom(name: '_CardModelBase.validate');

  @override
  DateTime get validate {
    _$validateAtom.reportRead();
    return super.validate;
  }

  @override
  set validate(DateTime value) {
    _$validateAtom.reportWrite(value, super.validate, () {
      super.validate = value;
    });
  }

  final _$dueDateAtom = Atom(name: '_CardModelBase.dueDate');

  @override
  DateTime get dueDate {
    _$dueDateAtom.reportRead();
    return super.dueDate;
  }

  @override
  set dueDate(DateTime value) {
    _$dueDateAtom.reportWrite(value, super.dueDate, () {
      super.dueDate = value;
    });
  }

  final _$last4DigitsAtom = Atom(name: '_CardModelBase.last4Digits');

  @override
  int get last4Digits {
    _$last4DigitsAtom.reportRead();
    return super.last4Digits;
  }

  @override
  set last4Digits(int value) {
    _$last4DigitsAtom.reportWrite(value, super.last4Digits, () {
      super.last4Digits = value;
    });
  }

  final _$markAtom = Atom(name: '_CardModelBase.mark');

  @override
  String get mark {
    _$markAtom.reportRead();
    return super.mark;
  }

  @override
  set mark(String value) {
    _$markAtom.reportWrite(value, super.mark, () {
      super.mark = value;
    });
  }

  final _$companyAtom = Atom(name: '_CardModelBase.company');

  @override
  String get company {
    _$companyAtom.reportRead();
    return super.company;
  }

  @override
  set company(String value) {
    _$companyAtom.reportWrite(value, super.company, () {
      super.company = value;
    });
  }

  final _$bestDateToPayAtom = Atom(name: '_CardModelBase.bestDateToPay');

  @override
  DateTime get bestDateToPay {
    _$bestDateToPayAtom.reportRead();
    return super.bestDateToPay;
  }

  @override
  set bestDateToPay(DateTime value) {
    _$bestDateToPayAtom.reportWrite(value, super.bestDateToPay, () {
      super.bestDateToPay = value;
    });
  }

  final _$activeAtom = Atom(name: '_CardModelBase.active');

  @override
  bool get active {
    _$activeAtom.reportRead();
    return super.active;
  }

  @override
  set active(bool value) {
    _$activeAtom.reportWrite(value, super.active, () {
      super.active = value;
    });
  }

  final _$optionsActiveAtom = Atom(name: '_CardModelBase.optionsActive');

  @override
  bool get optionsActive {
    _$optionsActiveAtom.reportRead();
    return super.optionsActive;
  }

  @override
  set optionsActive(bool value) {
    _$optionsActiveAtom.reportWrite(value, super.optionsActive, () {
      super.optionsActive = value;
    });
  }

  final _$debitAtom = Atom(name: '_CardModelBase.debit');

  @override
  bool get debit {
    _$debitAtom.reportRead();
    return super.debit;
  }

  @override
  set debit(bool value) {
    _$debitAtom.reportWrite(value, super.debit, () {
      super.debit = value;
    });
  }

  final _$creditAtom = Atom(name: '_CardModelBase.credit');

  @override
  bool get credit {
    _$creditAtom.reportRead();
    return super.credit;
  }

  @override
  set credit(bool value) {
    _$creditAtom.reportWrite(value, super.credit, () {
      super.credit = value;
    });
  }

  final _$showAtom = Atom(name: '_CardModelBase.show');

  @override
  bool get show {
    _$showAtom.reportRead();
    return super.show;
  }

  @override
  set show(bool value) {
    _$showAtom.reportWrite(value, super.show, () {
      super.show = value;
    });
  }

  final _$paymentsAtom = Atom(name: '_CardModelBase.payments');

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

  final _$_CardModelBaseActionController =
      ActionController(name: '_CardModelBase');

  @override
  dynamic changeId(int i) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeId');
    try {
      return super.changeId(i);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String n) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeName');
    try {
      return super.changeName(n);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeNumber(String n) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeNumber');
    try {
      return super.changeNumber(n);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeColor(Color c) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeColor');
    try {
      return super.changeColor(c);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLimit(double l) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeLimit');
    try {
      return super.changeLimit(l);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValidate(DateTime v) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeValidate');
    try {
      return super.changeValidate(v);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDueDate(DateTime d) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeDueDate');
    try {
      return super.changeDueDate(d);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeShow(bool s) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeShow');
    try {
      return super.changeShow(s);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLast4Digits(int l) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeLast4Digits');
    try {
      return super.changeLast4Digits(l);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMark(String m) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeMark');
    try {
      return super.changeMark(m);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCompany(String c) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeCompany');
    try {
      return super.changeCompany(c);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBestDateToPay(DateTime b) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeBestDateToPay');
    try {
      return super.changeBestDateToPay(b);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPayment(PaymentModel p) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.addPayment');
    try {
      return super.addPayment(p);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeToActived() {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeToActived');
    try {
      return super.changeToActived();
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeToDeactived() {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeToDeactived');
    try {
      return super.changeToDeactived();
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDebit(bool d) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeDebit');
    try {
      return super.changeDebit(d);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCredit(bool c) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeCredit');
    try {
      return super.changeCredit(c);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeOptionsActive(bool v) {
    final _$actionInfo = _$_CardModelBaseActionController.startAction(
        name: '_CardModelBase.changeOptionsActive');
    try {
      return super.changeOptionsActive(v);
    } finally {
      _$_CardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
number: ${number},
color: ${color},
limit: ${limit},
validate: ${validate},
dueDate: ${dueDate},
last4Digits: ${last4Digits},
mark: ${mark},
company: ${company},
bestDateToPay: ${bestDateToPay},
active: ${active},
optionsActive: ${optionsActive},
debit: ${debit},
credit: ${credit},
show: ${show},
payments: ${payments},
totalOfPayments: ${totalOfPayments},
creditDebitIsValid: ${creditDebitIsValid},
actualTotalLimit: ${actualTotalLimit},
totalThisMonth: ${totalThisMonth},
map: ${map},
pThisMonth: ${pThisMonth},
orderByCategory: ${orderByCategory},
number01: ${number01},
number02: ${number02},
number03: ${number03},
number04: ${number04},
numbers: ${numbers},
isValidName: ${isValidName},
isValidNumber: ${isValidNumber},
isValidColor: ${isValidColor},
isValidLimit: ${isValidLimit},
isAllValid: ${isAllValid},
types: ${types},
pSortedPayments: ${pSortedPayments},
paymentsPerDate: ${paymentsPerDate},
amountPaymentsThisMonth: ${amountPaymentsThisMonth},
invalidString: ${invalidString}
    ''';
  }
}
