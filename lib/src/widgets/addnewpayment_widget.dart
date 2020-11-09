import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/controllers/projects_controller.dart';
import 'package:minhasconta/src/widgets/card_widget.dart';
import 'package:minhasconta/src/widgets/project_widget.dart';

import 'addproject_widget.dart';

class AddNewPaymentWidget extends StatelessWidget {
  final cc = GetIt.instance<CardsController>();
  final c = GetIt.instance<PaymentController>();
  final cp = GetIt.instance<ProjectsController>();
  TextStyle titleStyle;
  @override
  Widget build(BuildContext context) {
    titleStyle = TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Theme.of(context).primaryColor);
    return LayoutBuilder(
      builder: (context, constraint) => Observer(
        builder: (_) => Container(
          padding: EdgeInsets.symmetric(
              horizontal: constraint.maxWidth * 0.05,
              vertical: constraint.maxHeight * 0.01),
          height: c.sizeBottom * constraint.maxHeight,
          width: constraint.maxWidth,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          child: c.step == 0
              ? step0(context)
              : c.step == 1
                  ? step1(context)
                  : c.step == 2
                      ? step2(context)
                      : c.step == 3
                          ? step3(context)
                          : c.step == 4
                              ? step4(context)
                              : Container(),
        ),
      ),
    );
  }

  step0(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Nova despesa',
                    style: titleStyle,
                  ),
                  InkWell(
                      onTap: () => c.cancelPayment(context),
                      child: Text('Cancelar'))
                ]),
          ),
          Flexible(
              child: Text(
            'Selecione a forma de pagamento',
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15),
          )),
          Expanded(
            flex: 4,
            child: Observer(
              builder: (_) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: cc.card.types
                      .map(
                        (e) => RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () => c.changeTypePayment(e.id),
                          child: Text(
                            e.name,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      )
                      .toList() /* [
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => c.changeTypePayment(0),
                    child: Text(
                      'Credito',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => c.changeTypePayment(1),
                    child: Text(
                      'Debito',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    onPressed: () => c.changeTypePayment(2),
                    child: Text(
                      'Dinheiro/Transf.',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ], */
                  ),
            ),
          )
        ],
      );
  step1(BuildContext context) => Column(
        children: [
          Flexible(
            child: Row(children: [
              IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () => c.backStep(context)),
              Text(
                'Qual o cartão utilizado?',
                style: titleStyle,
              ),
            ]),
          ),
          Expanded(
            flex: 4,
            child: LayoutBuilder(
              builder: (context, constraint) => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cc.cForList.length,
                  itemBuilder: (context, int index) => InkWell(
                      child: Container(
                        height: constraint.maxHeight * 0.3,
                        width: constraint.maxWidth * 0.9,
                        child: CardWidget(
                          card: cc.cForList[index],
                        ),
                      ),
                      onTap: () => c.selectCard(cc.cards[index].id))),
            ),
          ),
        ],
      );
  step2(BuildContext context) => Column(children: [
        Flexible(
          child: Row(children: [
            Flexible(
              flex: 1,
              child: IconButton(
                  icon: Icon(Icons.arrow_left),
                  onPressed: () => c.backStep(context)),
            ),
            Expanded(
              flex: 3,
              child: Text(
                'A despesa faz parte de algum projeto ou foi uma compra avulsa?',
                style: titleStyle,
              ),
            )
          ]),
        ),
        Expanded(
          flex: 3,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  onPressed: () => c.changeStep(3),
                  child: Text('Projeto'),
                ),
                RaisedButton(
                  color: Theme.of(context).primaryColor,
                  child: Text('Avulsa'),
                  onPressed: () => c.changeStep(4),
                )
              ]),
        ),
      ]);
  step3(BuildContext context) => Column(
        children: [
          Flexible(
            child: Row(children: [
              Flexible(
                flex: 1,
                child: IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () => c.backStep(context)),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Qual o projeto que deseja adicionar a despesa?',
                ),
              )
            ]),
          ),
          Expanded(
            flex: 4,
            child: cp.projects.length > 0
                ? ListView.builder(
                    itemCount: cp.projects.length,
                    itemBuilder: (context, int index) => ProjectWidget(
                      project: cp.projects[index],
                    ),
                  )
                : Column(
                    children: [
                      Expanded(
                          flex: 8,
                          child: Center(child: Text('Nenhum projeto criado'))),
                      Flexible(
                          flex: 2,
                          child: FlatButton(
                              onPressed: () => showModalBottomSheet(
                                  backgroundColor: Colors.transparent,
                                  context: context,
                                  builder: (context) => AddProjectWidget()),
                              child: Text('Criar Projeto')))
                    ],
                  ),
          )
        ],
      );
  step4(BuildContext context) => Column(children: [
        Flexible(
          child: Row(
            children: [
              Flexible(
                flex: 1,
                child: IconButton(
                    icon: Icon(Icons.arrow_left),
                    onPressed: () => c.backStep(context)),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'Informações da despesa',
                  style: titleStyle,
                ),
              )
            ],
          ),
        ),
        Expanded(
            child: Column(
          children: [
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
          ],
        ))
      ]);
}
