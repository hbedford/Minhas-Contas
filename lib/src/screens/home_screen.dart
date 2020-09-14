import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/creditcards_controller.dart';
import 'package:minhasconta/src/controllers/home_controller.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:minhasconta/src/screens/creditcard_screen.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';
import 'creditcards_screen.dart';

class HomeScreen extends StatelessWidget {
  final HomeController c = HomeController();
  final creditCardsController = GetIt.instance<CreditCardsController>();

  final List<ProjectModel> projects = [];
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
        builder: (context, constraint) => Stack(
          children: [
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => (c.changeAButton(!c.actionButton)),
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
                            ) /* Container(
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
