// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'paymentsofday_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentsOfDay on _PaymentsOfDayBase, Store {
  Computed<String> _$dateToStringComputed;

  @override
  String get dateToString =>
      (_$dateToStringComputed ??= Computed<String>(() => super.dateToString,
              name: '_PaymentsOfDayBase.dateToString'))
          .value;

  final _$dateAtom = Atom(name: '_PaymentsOfDayBase.date');

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

  final _$paymentsAtom = Atom(name: '_PaymentsOfDayBase.payments');

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
date: ${date},
payments: ${payments},
dateToString: ${dateToString}
    ''';
  }
}
