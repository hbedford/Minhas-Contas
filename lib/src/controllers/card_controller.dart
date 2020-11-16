import 'package:mobx/mobx.dart';
part 'card_controller.g.dart';

class CardController = _CardControllerBase with _$CardController;

abstract class _CardControllerBase with Store {
  @observable
  int month;
  _CardControllerBase({this.month});
  /*  @action
  Future<List<PaymentModel>> paymentsMonth() async {
    final c = GetIt.I.get<CardsController>();
    return await PaymentDB().getPaymentsOfMonth(
        id: c.card.id, month: month.toString().padLeft(2, '0'));
  } */
}
