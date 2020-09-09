import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:minhasconta/src/screens/creditcard_screen.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';
import 'package:mobx/mobx.dart';

import '../models/payment_model.dart';

class HomeScreen extends StatelessWidget {
  final List<ProjectModel> projects = [];
  final List<CreditCardModel> creditCards = [
    CreditCardModel(
      id: 1,
      name: 'Teste',
      color: Colors.green,
      payments: ObservableList.of(
        [
          PaymentModel(
              name: 'McDonald', date: DateTime.utc(2020, 09, 05), value: 200.0),
          PaymentModel(
              name: 'BurguerKing',
              date: DateTime.utc(2020, 09, 05),
              value: 10.0),
          PaymentModel(
              name: 'Bobs', date: DateTime.utc(2020, 09, 07), value: 203.0),
        ],
      ),
    ),
    CreditCardModel(id: 1, name: 'Teste', color: Colors.blue),
    CreditCardModel(id: 1, name: 'Teste', color: Colors.blue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas Contas'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: LayoutBuilder(
        builder: (context, constraint) => Stack(children: [
          Column(
            children: [
              Flexible(child: Container()),
              creditCardsInfo(constraint, context),
              Flexible(
                  child: LayoutBuilder(
                builder: (c, constraints) => Container(),
              ))
            ],
          ),
          Positioned(
              bottom: constraint.maxHeight * 0.2,
              right: constraint.maxWidth * 0.1,
              child: Row(
                children: [
                  Text('Gasto/Ganho'),
                  IconButton(icon: Icon(Icons.payment), onPressed: () => null)
                ],
              ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => null,
        child: Icon(Icons.add),
      ),
    );
  }

  creditCardsInfo(BoxConstraints constraint, BuildContext context) => Flexible(
        child: Column(
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cartões'),
                    FlatButton(
                      child: Text('ver detalhes'),
                      onPressed: () => null,
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              child: LayoutBuilder(
                builder: (c, constraints) => ListView(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: creditCards
                      .map(
                        (e) => InkWell(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CreditCardScreen(
                                          creditCard: e,
                                        ))),
                            child: CreditCardWidget(
                                constrainedBox: constraints,
                                creditCard:
                                    e) /* Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: constraints.maxWidth * 0.04,
                                vertical: constraints.maxWidth * 0.02),
                            child: Column(
                              children: [
                                Row(children: [Text(e.name)])
                              ],
                            ),
                            decoration: BoxDecoration(
                                color: e.color,
                                borderRadius: BorderRadius.circular(20)),
                            width: constraints.maxWidth * 0.9,
                            height: constraints.maxWidth * 0.2,
                          ), */
                            ),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
}
