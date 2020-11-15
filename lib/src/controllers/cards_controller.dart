import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minhasconta/src/db/models/card_db_model.dart';
import 'package:minhasconta/src/models/card_model.dart';
import 'package:minhasconta/src/widgets/flushbar_widget.dart';
import 'package:mobx/mobx.dart';
part 'cards_controller.g.dart';

class CardsController = _CardsControllerBase with _$CardsController;

abstract class _CardsControllerBase with Store {
  @observable
  CardModel card;
  @observable
  CardModel editCard;
  @observable
  bool cValidate;
  @observable
  bool cBestDate;
  @observable
  bool cLimit;
  @observable
  ScrollController scrollEditCard = ScrollController();
  @observable
  ObservableList cards = [].asObservable();
  @observable
  double scroll;
  _CardsControllerBase({
    this.card,
    this.cValidate,
    this.cBestDate,
    this.cLimit,
    this.cards,
    this.scroll = 0,
  });
  @action
  changeValidate(bool v) => cValidate = v;
  @action
  changeBestDate(bool v) => cBestDate = v;
  @action
  changeLimit(bool v) => cLimit = v;
  @action
  changeCard(CardModel c) => card = c;
  @action
  changeScroll(double s) => scroll = s;
  @action
  addNewCard() => editCard = CardModel.emptyCard();
  @action
  changeEditCard(CardModel c) => editCard = c;
  @action
  startScroll() => scrollEditCard = ScrollController();
  @action
  cancelCard() => editCard = null;

  //Necessario verificar os dados
  @action
  changeCards(List<CardModel> l) {
    cards = ObservableList.of(l);
    card = cForList.first;
  }

  @action
  saveCard(BuildContext context) async {
    if (editCard.isAllValid) {
      if (editCard.id != null) {
        int v = cards.indexWhere((element) => element.id == editCard.id);
        cards[v] = editCard;
        card = editCard;
        changeEditCard(null);
      } else {
        int v = await CardDB().registerCard(editCard);
        if (v != null) {
          editCard.changeId(v);
          cards.add(editCard);
          card = editCard;
          changeEditCard(null);
        }
      }
    } else
      flushBar(color: Colors.red, title: editCard.invalidString).show(context);
  }

  @action
  removeCard(BuildContext context) {}
  @computed
  int get actualCard => cards.indexOf(card);
  @computed
  List get cForList => cards.toList()..add(CardModel.addNew());
  @computed
  bool get editCardScrolled {
    if (editCard != null) {
      if (scrollEditCard.offset > 0) {
        return true;
      } else
        return false;
    } else
      return false;
  }
}
