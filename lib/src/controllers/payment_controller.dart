import 'package:minhasconta/src/models/payment_model.dart';
import 'package:mobx/mobx.dart';
part 'payment_controller.g.dart';

class PaymentController = _PaymentControllerBase with _$PaymentController;

abstract class _PaymentControllerBase with Store {
  @observable
  int step;
  @observable
  PaymentModel payment;
  _PaymentControllerBase({this.step, this.payment});
  @action
  changeStep(int i) => step = i;
  @action
  changePayment(PaymentModel p) => payment = p;
  @action
  initiatePayment() {
    changeStep(0);
    payment = PaymentModel();
  }

  @action
  changeTypePayment(int i) {
    changeStep(1);
    payment.changeTypePayment(i);
  }
}
