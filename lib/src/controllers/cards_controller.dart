import 'package:flutter/cupertino.dart';
import 'package:minhasconta/src/db/database.dart';
import 'package:minhasconta/src/models/card_model.dart';
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
  _CardsControllerBase(
      {this.card,
      this.cValidate,
      this.cBestDate,
      this.cLimit,
      this.cards,
      this.scroll = 0});
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

  //Necessario verificar os dados
  @action
  saveCard(BuildContext context) {
    if (editCard != null) {
      if (card.isAllValid) {
        final db = DatabaseHelper.instance;

        cards.add(editCard);
        editCard = null;
      } else {}
    } else if (card.id != null) {
      int id = cards.indexOf(card);
      cards[id] = card;
    }
  }

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
