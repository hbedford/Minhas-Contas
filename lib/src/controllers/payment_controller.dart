import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/payments_controller.dart';
import 'package:minhasconta/src/db/models/payment_db_model.dart';
import 'package:minhasconta/src/models/payment_model.dart';
import 'package:minhasconta/src/models/payment_type_model.dart';
import 'package:minhasconta/src/widgets/flushbar_widget.dart';
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
  initiatePayment() {
    final c = GetIt.I.get<CardsController>();
    final cc = GetIt.I.get<PaymentsController>();
    if (c.card != null && c.card.debitAndCredit) {
      changeStep(1);
      startStep = 1;
      payment = PaymentModel(
          cardId: c.card.id,
          type: null,
          date: DateTime.now(),
          nameEdit: TextEditingController(),
          amountEdit: TextEditingController(),
          valueEdit: MoneyMaskedTextController(
            initialValue: 0.0,
            precision: 2,
          ),
          time: TimeOfDay.now());
    } else if (c.card != null && c.card.onlyDebitOrCredit) {
      if (!c.card.debit) {
        changeStep(2);
        startStep = 2;
      } else {
        changeStep(1);
        startStep = 1;
      }
      payment = PaymentModel(
          cardId: c.card.id,
          type: c.card.debit ? null : cc.getTypeWithName('Credito'),
          nameEdit: TextEditingController(),
          amountEdit: TextEditingController(),
          valueEdit: MoneyMaskedTextController(
            initialValue: 0.0,
            precision: 2,
          ),
          date: DateTime.now(),
          time: TimeOfDay.now());
    } else {
      changeStep(0);
      startStep = 0;
      payment = PaymentModel(
        date: DateTime.now(),
        time: TimeOfDay.now(),
        nameEdit: TextEditingController(),
        amountEdit: TextEditingController(),
        valueEdit: MoneyMaskedTextController(
          initialValue: 0.0,
          precision: 2,
        ),
      );
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
        payment.changeCardId(null);
        changeStep(0);
      }
      if (step == 2) {
        payment.changeTypePayment(null);
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
  changeTypePayment(PaymentTypeModel t) {
    final c = GetIt.I.get<CardsController>();
    if (c.card == null)
      changeStep(1);
    else
      changeStep(2);
    payment.changeTypePayment(t);
  }

  @action
  registerPayment(BuildContext context) async {
    payment.checkInfos();
    if (payment.isAllValidWithCard) {
      PaymentDB().registerPayment(payment.map);
      final c = GetIt.I.get<CardsController>();
      c.card.changePayments(ObservableList<PaymentModel>.of(
          await PaymentDB().getPayments(cardId: payment.cardId)));
      print(c.card.payments.length);
    } else
      flushBar(color: Colors.red, title: payment.isNotValidWithCard)
          .show(context);
  }

  @computed
  double get sizeBottom {
    if (step == 0) return 0.3;
    if (step == 1)
      return 0.35;
    else if (step == 2)
      return 0.25;
    else if (step == 4)
      return 0.7;
    else
      return 0.3;
  }
}
