import 'package:minhasconta/src/models/creditcard_model.dart';
import 'package:mobx/mobx.dart';
part 'creditcards_controller.g.dart';

class CreditCardsController = _CreditCardsControllerBase
    with _$CreditCardsController;

abstract class _CreditCardsControllerBase with Store {
  @observable
  CreditCardModel creditCard;
  @observable
  bool cValidate;
  @observable
  bool cBestDate;
  @observable
  bool cLimit;
  @observable
  ObservableList creditCards = [].asObservable();
  _CreditCardsControllerBase(
      {this.creditCard,
      this.cValidate,
      this.cBestDate,
      this.cLimit,
      this.creditCards});
  @action
  changeValidate(bool v) => cValidate = v;
  @action
  changeBestDate(bool v) => cBestDate = v;
  @action
  changeLimit(bool v) => cLimit = v;
  @action
  cCreditCard(CreditCardModel c) => creditCard = c;
}
