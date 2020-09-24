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
  selectCreditCard(int v) {
    changeStep(2);
    payment.changeCreditCardId(v);
  }

  @action
  backStep(int v) {
    if (v == 0) {
      payment.changeTypePayment(null);
      changeStep(0);
    }
    if (v == 1) {
      payment.changeCreditCardId(null);
      changeStep(1);
    }
  }

  @action
  changeTypePayment(int i) {
    changeStep(1);
    payment.changeTypePayment(i);
  }
}
