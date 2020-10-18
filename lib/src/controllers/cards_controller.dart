import 'package:minhasconta/src/models/card_model.dart';
import 'package:mobx/mobx.dart';
part 'cards_controller.g.dart';

class CardsController = _CardsControllerBase with _$CardsController;

abstract class _CardsControllerBase with Store {
  @observable
  CardModel card;
  @observable
  bool cValidate;
  @observable
  bool cBestDate;
  @observable
  bool cLimit;
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
  @computed
  int get actualCard => cards.indexOf(card);
}
