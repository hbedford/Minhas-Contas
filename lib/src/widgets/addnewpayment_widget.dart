import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/controllers/projects_controller.dart';
import 'package:minhasconta/src/utils/dateandtime.dart';
import 'package:minhasconta/src/widgets/card_widget.dart';
import 'package:minhasconta/src/widgets/project_widget.dart';

import 'addproject_widget.dart';

class AddNewPaymentWidget extends StatefulWidget {
  @override
  _AddNewPaymentWidgetState createState() => _AddNewPaymentWidgetState();
}

class _AddNewPaymentWidgetState extends State<AddNewPaymentWidget> {
  final cc = GetIt.instance<CardsController>();
  final c = GetIt.instance<PaymentController>();
  final cp = GetIt.instance<ProjectsController>();
  TextStyle titleStyle;
  Widget getWidget(BuildContext context) {
    if (c.step == 0)
      return step0(context);
    else if (c.step == 1)
      return step1(context);
    else if (c.step == 2)
      return step2(context);
    else if (c.step == 3)
      return step3(context);
    else if (c.step == 4)
      return step4(context);
    else
      return Container();
  }

  @override
  Widget build(BuildContext context) {
    titleStyle = TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 14,
        color: Theme.of(context).primaryColor);
    return LayoutBuilder(
        builder: (context, constraint) => Observer(
            builder: (_) => Container(
                margin: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                padding: EdgeInsets.symmetric(
                    horizontal: constraint.maxWidth * 0.05,
                    vertical: constraint.maxHeight * 0.01),
                height: (c.sizeBottom * constraint.maxHeight),
                width: constraint.maxWidth,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                child: getWidget(context))));
  }

  step1(BuildContext context) =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
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
            ])),
        Flexible(
            child: Text('Selecione a forma de pagamento',
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 15))),
        Expanded(
            flex: 4,
            child: Observer(
                builder: (_) => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: cc.card.types
                        .map((e) => RaisedButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: () => c.changeTypePayment(e.id),
                            child:
                                Text(e.name, style: TextStyle(fontSize: 16))))
                        .toList())))
      ]);

  step0(BuildContext context) => Column(children: [
        back(() => c.backStep(context), 'Qual o cartão utilizado?'),
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
                            bottomSheet: cc.cForList[index] == cc.cForList.last
                                ? true
                                : false,
                            f: () {
                              Navigator.pop(context);
                              cc.addNewCard();
                            },
                            title: 'Adicionar Cartão',
                            card: cc.cForList[index],
                          ),
                        ),
                        onTap: () => c.selectCard(cc.cards[index].id)))))
      ]);

  step2(BuildContext context) =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        back(() => c.backStep(context),
            'A despesa faz parte de algum projeto ou foi uma compra avulsa?'),
        Expanded(
            flex: 3,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                      color: Theme.of(context).primaryColor,
                      onPressed: () => c.changeStep(3),
                      child: Text('Projeto')),
                  RaisedButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('Avulsa'),
                      onPressed: () => c.changeStep(4))
                ]))
      ]);

  step3(BuildContext context) => Column(
        children: [
          back(() => c.backStep(context),
              'Qual o projeto que deseja adicionar a despesa?'),
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
        back(() => c.backStep(context), 'Informações da despesa'),
        Expanded(
            flex: 6,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 5,
                            child: titleAndTextField(
                                controller: c.payment.nameEdit,
                                title: 'Produto:')),
                        Spacer(
                          flex: 1,
                        ),
                        Spacer(
                          flex: 1,
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                      flex: 2,
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                flex: 3,
                                child: Observer(
                                    builder: (_) => titleAndTextField(
                                        left: 'R\$ ',
                                        controller: c.payment.valueEdit,
                                        title: c.payment.typePrice
                                            ? 'Preço unitario'
                                            : 'Preço total',
                                        titleWidget: Observer(
                                          builder: (_) => Switch(
                                              activeColor: Theme.of(context)
                                                  .primaryColor,
                                              value: c.payment.typePrice,
                                              onChanged: (d) =>
                                                  c.payment.changeTypePrice(d)),
                                        ),
                                        type: TextInputType.number))),
                            Spacer(
                              flex: 1,
                            ),
                            Expanded(
                                flex: 1,
                                child: titleAndTextField(
                                    controller: c.payment.amountEdit,
                                    title: 'Qtd:',
                                    type: TextInputType.number)),
                          ])),
                  Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  subtitle('Horario'),
                                  InkWell(
                                    onTap: () => DateOrTimePicker().timePicker(
                                        context: context,
                                        initial: c.payment.timeToDuration),
                                    child: Text(c.payment.timeToString),
                                  )
                                ],
                              )),
                          Expanded(
                              flex: 2,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    subtitle('Data:'),
                                    InkWell(
                                      onTap: () => DateOrTimePicker()
                                          .datePicker(
                                              context: context,
                                              first: DateTime.now()
                                                  .subtract(Duration(days: 30)),
                                              initial: DateTime.now(),
                                              last: DateTime.now()
                                                  .add(Duration(days: 30))),
                                      child: Text(c.payment.dateBr),
                                    )
                                  ]))
                        ],
                      )),
                  /* Spacer(), */
                  Flexible(
                      flex: 2,
                      child: RaisedButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () => c.registerPayment(context),
                          padding: EdgeInsets.all(8),
                          child: Text('Registrar Despesa',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                              textAlign: TextAlign.center)))
                ]))
      ]);
  back(Function f, String title) => Flexible(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: c.step > c.startStep
                  ? MainAxisAlignment.start
                  : MainAxisAlignment.center,
              children: [
            Flexible(
                flex: 1,
                child: Visibility(
                    visible: c.step > c.startStep,
                    child: IconButton(
                        icon: Icon(Icons.arrow_left), onPressed: f))),
            Expanded(flex: 3, child: Text(title, style: titleStyle))
          ]));
  titleAndTextField(
          {TextEditingController controller,
          String left,
          String title,
          TextInputType type,
          Widget titleWidget}) =>
      LayoutBuilder(
          builder: (context, constraint) => Container(
              height: constraint.maxHeight,
              width: constraint.maxWidth,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    titleWidget != null
                        ? Container(
                            height: constraint.maxHeight * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [subtitle(title), titleWidget],
                            ),
                          )
                        : subtitle(title),
                    Container(
                        height: titleWidget != null
                            ? constraint.maxHeight * 0.35
                            : constraint.maxHeight * 0.5,
                        width: constraint.maxWidth,
                        child: TextField(
                          decoration: InputDecoration(prefixText: left),
                          controller: controller,
                          keyboardType: type,
                        ))
                  ])));

  subtitle(String t) => Text(t, style: Theme.of(context).textTheme.subtitle2);
}
