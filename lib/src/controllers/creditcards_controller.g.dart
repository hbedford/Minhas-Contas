// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creditcards_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreditCardsController on _CreditCardsControllerBase, Store {
  final _$creditCardAtom = Atom(name: '_CreditCardsControllerBase.creditCard');

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

  final _$cValidateAtom = Atom(name: '_CreditCardsControllerBase.cValidate');

  @override
  bool get cValidate {
    _$cValidateAtom.reportRead();
    return super.cValidate;
  }

  @override
  set cValidate(bool value) {
    _$cValidateAtom.reportWrite(value, super.cValidate, () {
      super.cValidate = value;
    });
  }

  final _$cBestDateAtom = Atom(name: '_CreditCardsControllerBase.cBestDate');

  @override
  bool get cBestDate {
    _$cBestDateAtom.reportRead();
    return super.cBestDate;
  }

  @override
  set cBestDate(bool value) {
    _$cBestDateAtom.reportWrite(value, super.cBestDate, () {
      super.cBestDate = value;
    });
  }

  final _$cLimitAtom = Atom(name: '_CreditCardsControllerBase.cLimit');

  @override
  bool get cLimit {
    _$cLimitAtom.reportRead();
    return super.cLimit;
  }

  @override
  set cLimit(bool value) {
    _$cLimitAtom.reportWrite(value, super.cLimit, () {
      super.cLimit = value;
    });
  }

  final _$creditCardsAtom =
      Atom(name: '_CreditCardsControllerBase.creditCards');

  @override
  ObservableList<dynamic> get creditCards {
    _$creditCardsAtom.reportRead();
    return super.creditCards;
  }

  @override
  set creditCards(ObservableList<dynamic> value) {
    _$creditCardsAtom.reportWrite(value, super.creditCards, () {
      super.creditCards = value;
    });
  }

  final _$_CreditCardsControllerBaseActionController =
      ActionController(name: '_CreditCardsControllerBase');

  @override
  dynamic changeValidate(bool v) {
    final _$actionInfo = _$_CreditCardsControllerBaseActionController
        .startAction(name: '_CreditCardsControllerBase.changeValidate');
    try {
      return super.changeValidate(v);
    } finally {
      _$_CreditCardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBestDate(bool v) {
    final _$actionInfo = _$_CreditCardsControllerBaseActionController
        .startAction(name: '_CreditCardsControllerBase.changeBestDate');
    try {
      return super.changeBestDate(v);
    } finally {
      _$_CreditCardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLimit(bool v) {
    final _$actionInfo = _$_CreditCardsControllerBaseActionController
        .startAction(name: '_CreditCardsControllerBase.changeLimit');
    try {
      return super.changeLimit(v);
    } finally {
      _$_CreditCardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCreditCard(CreditCardModel c) {
    final _$actionInfo = _$_CreditCardsControllerBaseActionController
        .startAction(name: '_CreditCardsControllerBase.changeCreditCard');
    try {
      return super.changeCreditCard(c);
    } finally {
      _$_CreditCardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
creditCard: ${creditCard},
cValidate: ${cValidate},
cBestDate: ${cBestDate},
cLimit: ${cLimit},
creditCards: ${creditCards}
    ''';
  }
}
