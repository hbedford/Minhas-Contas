import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:minhasconta/src/controllers/creditcard_controller.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';
import 'package:minhasconta/src/models/menu_model.dart';
import 'package:minhasconta/src/utils/converting_util.dart';

import '../models/menu_model.dart';

class CreditCardScreen extends StatelessWidget {
  final CreditCardModel cCard;
  CreditCardScreen({this.cCard});

  final Converting converting = Converting();
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
  final CreditCardController c = CreditCardController();

  @override
  Widget build(BuildContext context) {
    menu[0].cW(listWidget());
    menu[1].cW(chartsWidget());
    if (c.actualWidget == null) c.changeActualWidget(menu[0].widget);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Cartão de credito'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Gastos do mês'),
                    Text("R\$" + cCard.totalThisMonth.toString())
                  ],
                ),
                IconButton(icon: Icon(Icons.visibility), onPressed: () => null)
              ],
            ),
          ),
          Flexible(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: menu
                    .map(
                      (e) => IconButton(
                        icon: e.icon,
                        onPressed: () => c.changeActualWidget(e.widget),
                      ),
                    )
                    .toList(),
              )),
          Flexible(
            flex: 8,
            child: Observer(
                builder: (_) => Container(
                      padding: EdgeInsets.all(20),
                      child: c.actualWidget,
                      decoration: BoxDecoration(
                          color: Colors.black45,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                    )),
          ),
        ],
      ),
    );
  }

  Widget listWidget() {
    List<Widget> list = [];
    cCard.paymentsPerDate.map((element) {
      list.add(
        Container(
          margin: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Text(
                converting.dateIsToday(element.date)
                    ? 'Hoje'
                    : converting.dateDMtoS(element.date),
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ),
      );
      element.payments.forEach((e) => list.add(Card(
            color: Colors.white,
            child: ListTile(
              title: Text(e.name),
              trailing: Text(
                e.tPayment ? '+' : '-' + "R\$" + e.value.toString(),
                style: TextStyle(color: e.tPayment ? Colors.green : Colors.red),
              ),
            ),
          )));
    }).toList();

    return LayoutBuilder(
      builder: (context, constraints) =>
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Container(
          height: constraints.maxHeight * 0.08,
          child: Text(
            'Atividades',
            style: TextStyle(color: Colors.white),
          ),
        ),
        Expanded(
          child: ListView(children: list),
        )
      ]),
    );
  }

  Widget chartsWidget() => LayoutBuilder(
      builder: (context, constraints) => Column(
            children: [
              Container(
                child: Row(
                  children: [
                  Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: constraints.maxHeight * 0.1,
                              color: Colors.white,
                              width: 2,
                            ),
                            Column(
                              children: [Text('Mercado'), Text('R\$1000.00')],
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              height: constraints.maxHeight * 0.1,
                              color: Colors.white,
                              width: 2,
                            ),
                            Column(
                              children: [Text('Mercado'), Text('R\$1000.00')],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(children:[ new Center(
      child: new Container(
        height: 200.0,
        width: 200.0,
        child: new CustomPaint(
          foregroundPainter: new MyPainter(
              lineColor: Colors.amber,
              completeColor: Colors.blueAccent,
              completePercent: percentage,
              width: 8.0
          ),
          child: new Padding(
            padding: const EdgeInsets.all(8.0),
            child: new RaisedButton(
                color: Colors.purple,
                splashColor: Colors.blueAccent,
                shape: new CircleBorder(),
                child: new Text("Click"),
                onPressed: (){
                  
                }),
          ),
        ),
      ),
    )])
                  ],
                ),
              ),
            ],
          ));
  Widget configWidget() =>
      LayoutBuilder(builder: (context, constraints) => Column(children: []));
}
