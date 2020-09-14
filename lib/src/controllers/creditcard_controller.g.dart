// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditcard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreditCardController on _CreditCardControllerBase, Store {
  final _$actualWidgetAtom =
      Atom(name: '_CreditCardControllerBase.actualWidget');

  @override
  int get actualWidget {
    _$actualWidgetAtom.reportRead();
    return super.actualWidget;
  }

  @override
  set actualWidget(int value) {
    _$actualWidgetAtom.reportWrite(value, super.actualWidget, () {
      super.actualWidget = value;
    });
  }

  final _$_CreditCardControllerBaseActionController =
      ActionController(name: '_CreditCardControllerBase');

  @override
  dynamic changeActualWidget(int widget) {
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
actualWidget: ${actualWidget}
    ''';
  }
}
