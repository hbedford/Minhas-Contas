import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/creditcards_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';

class AddNewPaymentWidget extends StatelessWidget {
  final cc = GetIt.instance<CreditCardsController>();
  final c = GetIt.instance<PaymentController>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Observer(
        builder: (_) => Container(
          padding: EdgeInsets.symmetric(
              horizontal: constraint.maxWidth * 0.05,
              vertical: constraint.maxHeight * 0.02),
          height: constraint.maxHeight * 0.4,
          width: constraint.maxWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: c.step == 0 ? step0() : c.step == 1 ? step1() : Container(),
        ),
      ),
    );
  }

  step0() => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [Text('Nova despesa')]),
          Text('Selecione a forma de pagamento'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RaisedButton(
                onPressed: () => c.changeTypePayment(0),
                child: Text('Credito'),
              ),
              RaisedButton(
                onPressed: () => c.changeTypePayment(1),
                child: Text('debito'),
              ),
              RaisedButton(
                onPressed: () => c.changeTypePayment(2),
                child: Text('Dinheiro/Transf.'),
              ),
            ],
          )
        ],
      );
  step1() => Column(
        children: [
          Text('Qual o cartão utilizado?'),
          Expanded(
              child: LayoutBuilder(
            builder: (context, constraint) => ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cc.creditCards.length,
              itemBuilder: (context, int index) => CreditCardWidget(
                constrainedBox: constraint,
                creditCard: cc.creditCards[index],
              ),
            ),
          )),
        ],
      );
}
