// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditcard_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreditCardModel on _CreditCardModelBase, Store {
  Computed<double> _$totalOfPaymentsComputed;

  @override
  double get totalOfPayments => (_$totalOfPaymentsComputed ??= Computed<double>(
          () => super.totalOfPayments,
          name: '_CreditCardModelBase.totalOfPayments'))
      .value;
  Computed<String> _$actualTotalLimitComputed;

  @override
  String get actualTotalLimit => (_$actualTotalLimitComputed ??=
          Computed<String>(() => super.actualTotalLimit,
              name: '_CreditCardModelBase.actualTotalLimit'))
      .value;
  Computed<double> _$totalThisMonthComputed;

  @override
  double get totalThisMonth =>
      (_$totalThisMonthComputed ??= Computed<double>(() => super.totalThisMonth,
              name: '_CreditCardModelBase.totalThisMonth'))
          .value;
  Computed<List<PaymentModel>> _$pThisMonthComputed;

  @override
  List<PaymentModel> get pThisMonth => (_$pThisMonthComputed ??=
          Computed<List<PaymentModel>>(() => super.pThisMonth,
              name: '_CreditCardModelBase.pThisMonth'))
      .value;
  Computed<List<CategoryModel>> _$orderByCategoryComputed;

  @override
  List<CategoryModel> get orderByCategory => (_$orderByCategoryComputed ??=
          Computed<List<CategoryModel>>(() => super.orderByCategory,
              name: '_CreditCardModelBase.orderByCategory'))
      .value;
  Computed<List<dynamic>> _$pSortedPaymentsComputed;

  @override
  List<dynamic> get pSortedPayments => (_$pSortedPaymentsComputed ??=
          Computed<List<dynamic>>(() => super.pSortedPayments,
              name: '_CreditCardModelBase.pSortedPayments'))
      .value;
  Computed<List<PaymentsOfDay>> _$paymentsPerDateComputed;

  @override
  List<PaymentsOfDay> get paymentsPerDate => (_$paymentsPerDateComputed ??=
          Computed<List<PaymentsOfDay>>(() => super.paymentsPerDate,
              name: '_CreditCardModelBase.paymentsPerDate'))
      .value;
  Computed<int> _$amountPaymentsThisMonthComputed;

  @override
  int get amountPaymentsThisMonth => (_$amountPaymentsThisMonthComputed ??=
          Computed<int>(() => super.amountPaymentsThisMonth,
              name: '_CreditCardModelBase.amountPaymentsThisMonth'))
      .value;

  final _$idAtom = Atom(name: '_CreditCardModelBase.id');

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

  final _$nameAtom = Atom(name: '_CreditCardModelBase.name');

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

  final _$colorAtom = Atom(name: '_CreditCardModelBase.color');

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

  final _$limitAtom = Atom(name: '_CreditCardModelBase.limit');

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

  final _$validateAtom = Atom(name: '_CreditCardModelBase.validate');

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

  final _$dueDateAtom = Atom(name: '_CreditCardModelBase.dueDate');

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

  final _$last4DigitsAtom = Atom(name: '_CreditCardModelBase.last4Digits');

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

  final _$markAtom = Atom(name: '_CreditCardModelBase.mark');

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

  final _$companyAtom = Atom(name: '_CreditCardModelBase.company');

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

  final _$typeAtom = Atom(name: '_CreditCardModelBase.type');

  @override
  CardTypeModel get type {
    _$typeAtom.reportRead();
    return super.type;
  }

  @override
  set type(CardTypeModel value) {
    _$typeAtom.reportWrite(value, super.type, () {
      super.type = value;
    });
  }

  final _$bestDateToPayAtom = Atom(name: '_CreditCardModelBase.bestDateToPay');

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

  final _$activeAtom = Atom(name: '_CreditCardModelBase.active');

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

  final _$optionsActiveAtom = Atom(name: '_CreditCardModelBase.optionsActive');

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

  final _$paymentsAtom = Atom(name: '_CreditCardModelBase.payments');

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

  final _$_CreditCardModelBaseActionController =
      ActionController(name: '_CreditCardModelBase');

  @override
  dynamic changeName(String n) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeName');
    try {
      return super.changeName(n);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeColor(Color c) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeColor');
    try {
      return super.changeColor(c);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLimit(double l) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeLimit');
    try {
      return super.changeLimit(l);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeValidate(DateTime v) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeValidate');
    try {
      return super.changeValidate(v);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeDueDate(DateTime d) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeDueDate');
    try {
      return super.changeDueDate(d);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLast4Digits(int l) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeLast4Digits');
    try {
      return super.changeLast4Digits(l);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeMark(String m) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeMark');
    try {
      return super.changeMark(m);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCompany(String c) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeCompany');
    try {
      return super.changeCompany(c);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBestDateToPay(DateTime b) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeBestDateToPay');
    try {
      return super.changeBestDateToPay(b);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addPayment(PaymentModel p) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.addPayment');
    try {
      return super.addPayment(p);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeToActived() {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeToActived');
    try {
      return super.changeToActived();
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeToDeactived() {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeToDeactived');
    try {
      return super.changeToDeactived();
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeOptionsActive(bool v) {
    final _$actionInfo = _$_CreditCardModelBaseActionController.startAction(
        name: '_CreditCardModelBase.changeOptionsActive');
    try {
      return super.changeOptionsActive(v);
    } finally {
      _$_CreditCardModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
color: ${color},
limit: ${limit},
validate: ${validate},
dueDate: ${dueDate},
last4Digits: ${last4Digits},
mark: ${mark},
company: ${company},
type: ${type},
bestDateToPay: ${bestDateToPay},
active: ${active},
optionsActive: ${optionsActive},
payments: ${payments},
totalOfPayments: ${totalOfPayments},
actualTotalLimit: ${actualTotalLimit},
totalThisMonth: ${totalThisMonth},
pThisMonth: ${pThisMonth},
orderByCategory: ${orderByCategory},
pSortedPayments: ${pSortedPayments},
paymentsPerDate: ${paymentsPerDate},
amountPaymentsThisMonth: ${amountPaymentsThisMonth}
    ''';
  }
}
