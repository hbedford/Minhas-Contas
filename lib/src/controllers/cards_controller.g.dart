// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cards_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardsController on _CardsControllerBase, Store {
  Computed<int> _$actualCardComputed;

  @override
  int get actualCard =>
      (_$actualCardComputed ??= Computed<int>(() => super.actualCard,
              name: '_CardsControllerBase.actualCard'))
          .value;
  Computed<List<dynamic>> _$cForListComputed;

  @override
  List<dynamic> get cForList =>
      (_$cForListComputed ??= Computed<List<dynamic>>(() => super.cForList,
              name: '_CardsControllerBase.cForList'))
          .value;

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

  final _$newCardAtom = Atom(name: '_CardsControllerBase.newCard');

  @override
  CardModel get newCard {
    _$newCardAtom.reportRead();
    return super.newCard;
  }

  @override
  set newCard(CardModel value) {
    _$newCardAtom.reportWrite(value, super.newCard, () {
      super.newCard = value;
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

  final _$scrollAtom = Atom(name: '_CardsControllerBase.scroll');

  @override
  double get scroll {
    _$scrollAtom.reportRead();
    return super.scroll;
  }

  @override
  set scroll(double value) {
    _$scrollAtom.reportWrite(value, super.scroll, () {
      super.scroll = value;
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
  dynamic changeScroll(double s) {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.changeScroll');
    try {
      return super.changeScroll(s);
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addNewCard() {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.addNewCard');
    try {
      return super.addNewCard();
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
card: ${card},
newCard: ${newCard},
cValidate: ${cValidate},
cBestDate: ${cBestDate},
cLimit: ${cLimit},
cards: ${cards},
scroll: ${scroll},
actualCard: ${actualCard},
cForList: ${cForList}
    ''';
  }
}
