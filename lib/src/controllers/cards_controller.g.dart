// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardsController on _CardsControllerBase, Store {
  final _$cardAtom = Atom(name: '_CardsControllerBase.card');

  @override
  CardModel get card {
    _$cardAtom.reportRead();
    return super.card;
  }

  @override
  set card(CardModel value) {
    _$cardAtom.reportWrite(value, super.card, () {
      super.card = value;
    });
  }

  final _$cValidateAtom = Atom(name: '_CardsControllerBase.cValidate');

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

  final _$cBestDateAtom = Atom(name: '_CardsControllerBase.cBestDate');

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

  final _$cLimitAtom = Atom(name: '_CardsControllerBase.cLimit');

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

  final _$cardsAtom = Atom(name: '_CardsControllerBase.cards');

  @override
  ObservableList<dynamic> get cards {
    _$cardsAtom.reportRead();
    return super.cards;
  }

  @override
  set cards(ObservableList<dynamic> value) {
    _$cardsAtom.reportWrite(value, super.cards, () {
      super.cards = value;
    });
  }

  final _$_CardsControllerBaseActionController =
      ActionController(name: '_CardsControllerBase');

  @override
  dynamic changeValidate(bool v) {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.changeValidate');
    try {
      return super.changeValidate(v);
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeBestDate(bool v) {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.changeBestDate');
    try {
      return super.changeBestDate(v);
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeLimit(bool v) {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.changeLimit');
    try {
      return super.changeLimit(v);
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCard(CardModel c) {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.changeCard');
    try {
      return super.changeCard(c);
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
card: ${card},
cValidate: ${cValidate},
cBestDate: ${cBestDate},
cLimit: ${cLimit},
cards: ${cards}
    ''';
  }
}
