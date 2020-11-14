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
  Computed<bool> _$editCardScrolledComputed;

  @override
  bool get editCardScrolled => (_$editCardScrolledComputed ??= Computed<bool>(
          () => super.editCardScrolled,
          name: '_CardsControllerBase.editCardScrolled'))
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

  final _$editCardAtom = Atom(name: '_CardsControllerBase.editCard');

  @override
  CardModel get editCard {
    _$editCardAtom.reportRead();
    return super.editCard;
  }

  @override
  set editCard(CardModel value) {
    _$editCardAtom.reportWrite(value, super.editCard, () {
      super.editCard = value;
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

  final _$scrollEditCardAtom =
      Atom(name: '_CardsControllerBase.scrollEditCard');

  @override
  ScrollController get scrollEditCard {
    _$scrollEditCardAtom.reportRead();
    return super.scrollEditCard;
  }

  @override
  set scrollEditCard(ScrollController value) {
    _$scrollEditCardAtom.reportWrite(value, super.scrollEditCard, () {
      super.scrollEditCard = value;
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

  final _$saveCardAsyncAction = AsyncAction('_CardsControllerBase.saveCard');

  @override
  Future saveCard(BuildContext context) {
    return _$saveCardAsyncAction.run(() => super.saveCard(context));
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
  dynamic changeEditCard(CardModel c) {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.changeEditCard');
    try {
      return super.changeEditCard(c);
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startScroll() {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.startScroll');
    try {
      return super.startScroll();
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cancelCard() {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.cancelCard');
    try {
      return super.cancelCard();
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCards(List<CardModel> l) {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.changeCards');
    try {
      return super.changeCards(l);
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeCard(BuildContext context) {
    final _$actionInfo = _$_CardsControllerBaseActionController.startAction(
        name: '_CardsControllerBase.removeCard');
    try {
      return super.removeCard(context);
    } finally {
      _$_CardsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
card: ${card},
editCard: ${editCard},
cValidate: ${cValidate},
cBestDate: ${cBestDate},
cLimit: ${cLimit},
scrollEditCard: ${scrollEditCard},
cards: ${cards},
scroll: ${scroll},
actualCard: ${actualCard},
cForList: ${cForList},
editCardScrolled: ${editCardScrolled}
    ''';
  }
}
