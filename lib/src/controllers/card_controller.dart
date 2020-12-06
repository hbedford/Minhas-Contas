import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/db/models/payment_db_model.dart';
import 'package:minhasconta/src/models/payment_model.dart';
import 'package:minhasconta/src/utils/converting_util.dart';
import 'package:mobx/mobx.dart';

import 'cards_controller.dart';
part 'card_controller.g.dart';

class CardController = _CardControllerBase with _$CardController;

abstract class _CardControllerBase with Store {
  @observable
  int month;
  @observable
  List<String> days;
  @observable
  List<int> daysInt;
  @observable
  ObservableList<PaymentModel> payments;
  @observable
  String day;
  _CardControllerBase() {
    this.days = ['7', '15', '30', '60', '90', 'Ano'];
    this.daysInt = [7, 15, 30, 60, 90, 365];
    this.day = '7';
  }
  @action
  changeDay(String d) {
    day = d;
    paymentsDays();
  }

  @action
  paymentsDays() async {
    DateTime d =
        DateTime.now().subtract(Duration(days: daysInt[days.indexOf(day)]));
    final c = GetIt.I.get<CardsController>();
    payments = await PaymentDB()
        .getPaymentsOfDays(id: c.card.id, day: Converting().dateToString(d));
  }
}
