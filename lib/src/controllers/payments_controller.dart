import 'package:minhasconta/src/models/payment_model.dart';
import 'package:mobx/mobx.dart';
part 'payments_controller.g.dart';

class PaymentsController = _PaymentsControllerBase with _$PaymentsController;

abstract class _PaymentsControllerBase with Store {
  @observable
  ObservableList payments = [].asObservable();
  _PaymentsControllerBase({this.payments});
  @action
  getPayments() {}
  @action
  addPayment(PaymentModel p) => payments.add(p);
}
