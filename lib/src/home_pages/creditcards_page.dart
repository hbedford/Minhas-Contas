import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/creditcards_controller.dart';
import 'package:minhasconta/src/controllers/home_controller.dart';
import 'package:minhasconta/src/screens/creditcard_screen.dart';
import 'package:minhasconta/src/screens/creditcards_screen.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';

class CreditCardsPage extends StatelessWidget {
  final c = GetIt.instance<HomeController>();
  final creditCardsController = GetIt.instance<CreditCardsController>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Stack(
        children: [
          /* bottomMenu(constraint), */
          Container(
            height: constraint.maxHeight * 0.1,
          ),
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
          Observer(
              builder: (_) => Visibility(
                  visible: c.actionButton,
                  child: Positioned(
                      bottom: constraint.maxHeight * 0.2,
                      right: constraint.maxWidth * 0.1,
                      child: Row(children: [
                        Text('Gasto/Ganho'),
                        IconButton(
                            icon: Icon(Icons.payment), onPressed: () => null)
                      ]))))
        ],
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
                    Text(
                      'Cartões',
                      style: TextStyle(),
                    ),
                    FlatButton(
                      child: Text('ver detalhes'),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreditCardsScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: LayoutBuilder(
                builder: (c, constraints) => ListView(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: creditCardsController.creditCards
                      .map(
                        (e) => InkWell(
                            onTap: () {
                              creditCardsController.changeCreditCard(e);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreditCardScreen()));
                            },
                            child: CreditCardWidget(
                              creditCard: e,
                              constrainedBox: constraints,
                            )),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
}
