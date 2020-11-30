// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PaymentController on _PaymentControllerBase, Store {
  Computed<double> _$sizeBottomComputed;

  @override
  double get sizeBottom =>
      (_$sizeBottomComputed ??= Computed<double>(() => super.sizeBottom,
              name: '_PaymentControllerBase.sizeBottom'))
          .value;
  Computed<List<PaymentTypeModel>> _$typesCardComputed;

  @override
  List<PaymentTypeModel> get typesCard => (_$typesCardComputed ??=
          Computed<List<PaymentTypeModel>>(() => super.typesCard,
              name: '_PaymentControllerBase.typesCard'))
      .value;

  final _$stepAtom = Atom(name: '_PaymentControllerBase.step');

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

  final _$startStepAtom = Atom(name: '_PaymentControllerBase.startStep');

  @override
  int get startStep {
    _$startStepAtom.reportRead();
    return super.startStep;
  }

  @override
  set startStep(int value) {
    _$startStepAtom.reportWrite(value, super.startStep, () {
      super.startStep = value;
    });
  }

  final _$paymentAtom = Atom(name: '_PaymentControllerBase.payment');

  @override
  PaymentModel get payment {
    _$paymentAtom.reportRead();
    return super.payment;
  }

  @override
  set payment(PaymentModel value) {
    _$paymentAtom.reportWrite(value, super.payment, () {
      super.payment = value;
    });
  }

  final _$registerPaymentAsyncAction =
      AsyncAction('_PaymentControllerBase.registerPayment');

  @override
  Future registerPayment(BuildContext context) {
    return _$registerPaymentAsyncAction
        .run(() => super.registerPayment(context));
  }

  final _$_PaymentControllerBaseActionController =
      ActionController(name: '_PaymentControllerBase');

  @override
  dynamic changeStep(int i) {
    final _$actionInfo = _$_PaymentControllerBaseActionController.startAction(
        name: '_PaymentControllerBase.changeStep');
    try {
      return super.changeStep(i);
    } finally {
      _$_PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePayment(PaymentModel p) {
    final _$actionInfo = _$_PaymentControllerBaseActionController.startAction(
        name: '_PaymentControllerBase.changePayment');
    try {
      return super.changePayment(p);
    } finally {
      _$_PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic initiatePayment() {
    final _$actionInfo = _$_PaymentControllerBaseActionController.startAction(
        name: '_PaymentControllerBase.initiatePayment');
    try {
      return super.initiatePayment();
    } finally {
      _$_PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectCard(int v) {
    final _$actionInfo = _$_PaymentControllerBaseActionController.startAction(
        name: '_PaymentControllerBase.selectCard');
    try {
      return super.selectCard(v);
    } finally {
      _$_PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic backStep(BuildContext context) {
    final _$actionInfo = _$_PaymentControllerBaseActionController.startAction(
        name: '_PaymentControllerBase.backStep');
    try {
      return super.backStep(context);
    } finally {
      _$_PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cancelPayment(BuildContext context) {
    final _$actionInfo = _$_PaymentControllerBaseActionController.startAction(
        name: '_PaymentControllerBase.cancelPayment');
    try {
      return super.cancelPayment(context);
    } finally {
      _$_PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeTypePayment(PaymentTypeModel t) {
    final _$actionInfo = _$_PaymentControllerBaseActionController.startAction(
        name: '_PaymentControllerBase.changeTypePayment');
    try {
      return super.changeTypePayment(t);
    } finally {
      _$_PaymentControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
step: ${step},
startStep: ${startStep},
payment: ${payment},
sizeBottom: ${sizeBottom},
typesCard: ${typesCard}
    ''';
  }
}
