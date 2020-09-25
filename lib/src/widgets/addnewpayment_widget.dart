import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/creditcards_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/controllers/projects_controller.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';
import 'package:minhasconta/src/widgets/project_widget.dart';

class AddNewPaymentWidget extends StatelessWidget {
  final cc = GetIt.instance<CreditCardsController>();
  final c = GetIt.instance<PaymentController>();
  final cp = GetIt.instance<ProjectsController>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Observer(
        builder: (_) => Container(
            padding: EdgeInsets.symmetric(
                horizontal: constraint.maxWidth * 0.05,
                vertical: constraint.maxHeight * 0.05),
            height: constraint.maxHeight * (c.step == 4 ? 0.8 : 0.4),
            width: constraint.maxWidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            child: Expanded(
              child: c.step == 0
                  ? step0()
                  : c.step == 1
                      ? step1()
                      : c.step == 2
                          ? step2()
                          : c.step == 3
                              ? step3()
                              : c.step == 4 ? step4() : Container(),
            )),
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
          Flexible(
            child: Row(children: [
              IconButton(
                  icon: Icon(Icons.arrow_left), onPressed: () => c.backStep(0)),
              Text('Qual o cartão utilizado?'),
            ]),
          ),
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraint) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cc.creditCards.length,
                  itemBuilder: (context, int index) => InkWell(
                      child: CreditCardWidget(
                        constrainedBox: constraint,
                        creditCard: cc.creditCards[index],
                      ),
                      onTap: () =>
                          c.selectCreditCard(cc.creditCards[index].id))),
            ),
          ),
        ],
      );
  step2() => Column(children: [
        Row(children: [
          Flexible(
            flex: 1,
            child: IconButton(
                icon: Icon(Icons.arrow_left), onPressed: () => c.backStep(1)),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'A despesa faz parte de algum projeto ou foi uma compra avulsa?',
            ),
          )
        ]),
        Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          RaisedButton(
            onPressed: () => c.changeStep(3),
            child: Text('Sim'),
          ),
          RaisedButton(
            child: Text('Não'),
            onPressed: () => c.changeStep(4),
          )
        ]),
      ]);
  step3() => Column(
        children: [
          Text('Qual projeto?'),
          Visibility(
            visible: cp.projects.length > 0,
            child: Expanded(
              child: ListView.builder(
                itemCount: cp.projects.length,
                itemBuilder: (context, int index) => ProjectWidget(
                  project: cp.projects[index],
                ),
              ),
            ),
          ),
          Visibility(
              visible: cp.projects.length == 0,
              child: Text('Nenhum projeto criado'))
        ],
      );
  step4() => Column(children: [
        Text('Informações da despesa'),
        Text('Produto'),
        TextField(),
        Text('Quantidade'),
        TextField(),
        Text('Foi comprado hoje?'),
        Row(
          children: [
            RaisedButton(onPressed: () => null, child: Text('Sim')),
            RaisedButton(
              onPressed: () => null,
              child: Text('Não'),
            ),
          ],
        ),
      ]);
}
