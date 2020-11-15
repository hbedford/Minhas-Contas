import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/db/models/payment_db_model.dart';
import 'package:minhasconta/src/models/payment_model.dart';
import 'package:mobx/mobx.dart';
part 'card_controller.g.dart';

class CardController = _CardControllerBase with _$CardController;

abstract class _CardControllerBase with Store {
  @observable
  int month;
  _CardControllerBase({this.month});
  Future<List<PaymentModel>> get paymentsMonth async {
    final c = GetIt.I.get<CardsController>();
    return await PaymentDB().getPaymentsOfMonth(
        id: c.card.id, month: month.toString().padLeft(2, '0'));
  }
}
