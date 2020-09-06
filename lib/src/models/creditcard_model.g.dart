// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditcard_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreditCardModel on _CreditCardModelBase, Store {
  Computed<double> _$totalPaymentsComputed;

  @override
  double get totalPayments =>
      (_$totalPaymentsComputed ??= Computed<double>(() => super.totalPayments,
              name: '_CreditCardModelBase.totalPayments'))
          .value;
  Computed<String> _$actualTotalLimitComputed;

  @override
  String get actualTotalLimit => (_$actualTotalLimitComputed ??=
          Computed<String>(() => super.actualTotalLimit,
              name: '_CreditCardModelBase.actualTotalLimit'))
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

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
color: ${color},
limit: ${limit},
payments: ${payments},
totalPayments: ${totalPayments},
actualTotalLimit: ${actualTotalLimit}
    ''';
  }
}
