import 'package:mobx/mobx.dart';
part 'card_controller.g.dart';

class CardController = _CardControllerBase with _$CardController;

abstract class _CardControllerBase with Store {
  @observable
  int month;
  @observable
  List<String> days;
  @observable
  String day;
  _CardControllerBase()
      : this.days = ['7', '15', '30', '60', '90'],
        this.day = '7';
  @action
  changeDay(String d) => day = d;
  /*  @action
  Future<List<PaymentModel>> paymentsMonth() async {
    final c = GetIt.I.get<CardsController>();
    return await PaymentDB().getPaymentsOfMonth(
        id: c.card.id, month: month.toString().padLeft(2, '0'));
  } */
}
