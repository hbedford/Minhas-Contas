import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/payments_controller.dart';
import 'package:minhasconta/src/models/payment_model.dart';
import 'package:mobx/mobx.dart';
part 'payment_controller.g.dart';

class PaymentController = _PaymentControllerBase with _$PaymentController;

abstract class _PaymentControllerBase with Store {
  @observable
  int step;
  @observable
  int startStep;
  @observable
  PaymentModel payment;
  _PaymentControllerBase({this.step, this.payment, this.startStep = 0});
  @action
  changeStep(int i) => step = i;
  @action
  changePayment(PaymentModel p) => payment = p;
  @action
  initiatePayment(int s) {
    startStep = s;
    final c = GetIt.I.get<CardsController>();
    if (c.card != null && c.card.types.length > 1) {
      changeStep(0);
      payment = PaymentModel(cardId: c.card.id, type: null);
    } else if (c.card != null && c.card.types.length == 1) {
      changeStep(2);
      payment = PaymentModel(cardId: c.card.id, type: c.card.types.first);
    } else {
      changeStep(0);
      payment = PaymentModel();
    }
  }

  @action
  selectCard(int v) {
    changeStep(2);
    payment.changeCardId(v);
  }

  @action
  backStep(BuildContext context) {
    if (step == startStep) {
      Navigator.pop(context);
    } else {
      if (step == 1) {
        payment.changeTypePayment(null);
        changeStep(0);
      }
      if (step == 2) {
        payment.changeCardId(null);
        changeStep(1);
      } else if (step == 0) {
        Navigator.pop(context);
      } else if (step == 4) {
        changeStep(2);
      } else {
        changeStep(step - 1);
      }
    }
  }

  @action
  cancelPayment(BuildContext context) {
    changePayment(null);
    changeStep(null);
    Navigator.pop(context);
  }

  @action
  changeTypePayment(int i) {
    final c = GetIt.I.get<CardsController>();
    final cc = GetIt.I.get<PaymentsController>();
    if (c.card == null)
      changeStep(1);
    else
      changeStep(2);
    payment.changeTypePayment(cc.types[i]);
  }

  @computed
  double get sizeBottom {
    if (step == 0)
      return 0.7;
    else if (step == 4)
      return 0.4;
    else
      return 0.3;
  }
}
