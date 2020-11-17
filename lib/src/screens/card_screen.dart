import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/models/menu_model.dart';
import 'package:minhasconta/src/utils/converting_util.dart';
import 'package:minhasconta/src/widgets/chartcircle_widget.dart';

import '../models/menu_model.dart';

class CardScreen extends StatelessWidget {
  CardScreen();
  final cardsController = GetIt.instance<CardsController>();
  final c = GetIt.instance<CardsController>();

  final Converting converting = Converting();
  MenuModel actualWidget;
  final List<MenuModel> menu = [
    MenuModel(
      icon: Icon(Icons.format_list_bulleted),
      name: 'Lista',
    ),
    MenuModel(
      icon: Icon(Icons.insert_chart),
    ),
    MenuModel(icon: Icon(Icons.settings))
  ];
  // final CreditCardController c = CreditCardController();

  @override
  Widget build(BuildContext context) {
    menu[0].cW(0);
    menu[1].cW(1);
    actualWidget = menu[0];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          'Cartão de credito',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /* Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gastos do mês'),
                    Text("R\$" +
                        creditCardsController.creditCard.totalThisMonth
                            .toString())
                  ],
                ),
                IconButton(icon: Icon(Icons.visibility), onPressed: () => null)
              ],
            ),
          ), */
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: menu
                    .map(
                      (e) => IconButton(
                        icon: e.icon,
                        onPressed: () =>
                            null /* c.changeActualWidget(e.widget) */,
                      ),
                    )
                    .toList(),
              )),
          Flexible(
            flex: 8,
            child: LayoutBuilder(
                builder: (context, constraint) => Container(
                    height: constraint.maxHeight,
                    width: constraint.maxWidth,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios_outlined),
                              onPressed: null),
                          Text(''),
                          IconButton(
                              icon: Icon(Icons.arrow_forward_ios_outlined),
                              onPressed: null)
                        ],
                      ),
                      Card()
                    ]) /* actualWidget == menu.first
                            ? chartsWidget()
                            : listWidget(),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(20))), */
                    )),
          ),
        ],
      ),
    );
  }

  Widget listWidget() {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: constraints.maxHeight * 0.08,
            child: Text(
              'Atividades',
              style: TextStyle(color: Colors.black),
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              List<Widget> l = [];
              cardsController.card.paymentsPerDate.map((e) {
                l.add(
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Row(
                      children: [
                        Text(
                          converting.dateIsToday(e.date)
                              ? 'Hoje'
                              : converting.dateDMtoS(e.date),
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                );
                e.payments.forEach((p) {
                  l.add(Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(100)),
                    child: ListTile(
                      title: Text(p.name),
                      trailing: Text(p.value.toString()),
                    ),
                  ));
                });
              }).toList();

              return ListView(children: l);
            }),
          ),
        ],
      ),
    );
  }

  Widget chartsWidget() => LayoutBuilder(
      builder: (context, constraints) => Column(
            children: [
              Container(
                height: constraints.maxHeight * 0.3,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: cInfoLeft(
                                title: 'Total de compras',
                                icon: Icon(Icons.shopping_cart),
                                info: cardsController
                                    .card.amountPaymentsThisMonth
                                    .toString()),
                          ),
                          Flexible(
                            child: cInfoLeft(
                                title: 'Categorias',
                                info: '',
                                icon: Icon(Icons.email)),
                          ),
                        ],
                      ),
                    ),
                    Flexible(flex: 2, child: cInfoRight())
                  ],
                ),
              ),
            ],
          ));
  cInfoLeft({String title, Icon icon, String info}) => LayoutBuilder(
        builder: (context, constraint) => Container(
          height: constraint.maxHeight,
          width: constraint.maxWidth,
          child: Row(
            children: [
              Container(
                margin:
                    EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.1),
                height: constraint.maxHeight * 0.6,
                color: Colors.grey,
                width: 2,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title),
                  Row(children: [icon, Text(info)])
                ],
              ),
            ],
          ),
        ),
      );
  cInfoRight() => LayoutBuilder(
        builder: (context, constraints) =>
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          new Center(
            child: new Container(
              height: constraints.maxHeight * 0.8,
              width: constraints.maxHeight * 0.6,
              child: new CustomPaint(
                foregroundPainter: new MyPainter(
                    lineColor: Colors.amber,
                    completeColor: Colors.blueAccent,
                    completePercent: 20,
                    width: 4.0),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        cardsController.card.totalThisMonthCredit.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text('de ' + cardsController.card.limit.toString())
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      );
  Widget configWidget() =>
      LayoutBuilder(builder: (context, constraints) => Column(children: []));
}
