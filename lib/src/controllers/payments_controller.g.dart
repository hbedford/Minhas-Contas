// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payments_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentsController on _PaymentsControllerBase, Store {
  final _$typesAtom = Atom(name: '_PaymentsControllerBase.types');

  @override
  ObservableList<PaymentTypeModel> get types {
    _$typesAtom.reportRead();
    return super.types;
  }

  @override
  set types(ObservableList<PaymentTypeModel> value) {
    _$typesAtom.reportWrite(value, super.types, () {
      super.types = value;
    });
  }

  final _$typeAtom = Atom(name: '_PaymentsControllerBase.type');

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

  final _$paymentsAtom = Atom(name: '_PaymentsControllerBase.payments');

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

  final _$_PaymentsControllerBaseActionController =
      ActionController(name: '_PaymentsControllerBase');

  @override
  dynamic addPayment(PaymentModel p) {
    final _$actionInfo = _$_PaymentsControllerBaseActionController.startAction(
        name: '_PaymentsControllerBase.addPayment');
    try {
      return super.addPayment(p);
    } finally {
      _$_PaymentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTypes(List<PaymentTypeModel> l) {
    final _$actionInfo = _$_PaymentsControllerBaseActionController.startAction(
        name: '_PaymentsControllerBase.changeTypes');
    try {
      return super.changeTypes(l);
    } finally {
      _$_PaymentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  PaymentTypeModel getTypeWithId(int i) {
    final _$actionInfo = _$_PaymentsControllerBaseActionController.startAction(
        name: '_PaymentsControllerBase.getTypeWithId');
    try {
      return super.getTypeWithId(i);
    } finally {
      _$_PaymentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  PaymentTypeModel getTypeWithName(String name) {
    final _$actionInfo = _$_PaymentsControllerBaseActionController.startAction(
        name: '_PaymentsControllerBase.getTypeWithName');
    try {
      return super.getTypeWithName(name);
    } finally {
      _$_PaymentsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
types: ${types},
type: ${type},
payments: ${payments}
    ''';
  }
}
