// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditcard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreditCardController on _CreditCardControllerBase, Store {
  Computed<List<dynamic>> _$listPaymentsComputed;

  @override
  List<dynamic> get listPayments => (_$listPaymentsComputed ??=
          Computed<List<dynamic>>(() => super.listPayments,
              name: '_CreditCardControllerBase.listPayments'))
      .value;

  final _$actualWidgetAtom =
      Atom(name: '_CreditCardControllerBase.actualWidget');

  @override
  Widget get actualWidget {
    _$actualWidgetAtom.reportRead();
    return super.actualWidget;
  }

  @override
  set actualWidget(Widget value) {
    _$actualWidgetAtom.reportWrite(value, super.actualWidget, () {
      super.actualWidget = value;
    });
  }

  final _$creditCardAtom = Atom(name: '_CreditCardControllerBase.creditCard');

  @override
  CreditCardModel get creditCard {
    _$creditCardAtom.reportRead();
    return super.creditCard;
  }

  @override
  set creditCard(CreditCardModel value) {
    _$creditCardAtom.reportWrite(value, super.creditCard, () {
      super.creditCard = value;
    });
  }

  final _$_CreditCardControllerBaseActionController =
      ActionController(name: '_CreditCardControllerBase');

  @override
  dynamic changeActualWidget(Widget widget) {
    final _$actionInfo = _$_CreditCardControllerBaseActionController
        .startAction(name: '_CreditCardControllerBase.changeActualWidget');
    try {
      return super.changeActualWidget(widget);
    } finally {
      _$_CreditCardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actualWidget: ${actualWidget},
creditCard: ${creditCard},
listPayments: ${listPayments}
    ''';
  }
}
