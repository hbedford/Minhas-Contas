import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/creditcards_controller.dart';
import 'package:minhasconta/src/controllers/home_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/models/menu_model.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:minhasconta/src/screens/configs_screen.dart';
import 'package:minhasconta/src/screens/creditcard_screen.dart';
import 'package:minhasconta/src/screens/projects_screen.dart';
import 'package:minhasconta/src/widgets/addnewpayment_widget.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';
import 'creditcards_screen.dart';

class HomeScreen extends StatelessWidget {
  final c = GetIt.instance<HomeController>();
  final creditCardsController = GetIt.instance<CreditCardsController>();
  final cp = GetIt.instance<PaymentController>();
  final List<ProjectModel> projects = [];
  final List<MenuModel> list = [
    MenuModel(
      name: 'Cartões',
      icon: Icon(Icons.credit_card),
    ),
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
      body: Observer(
          builder: (_) => c.index == 0
              ? Container()
              : c.index == 1
                  ? creditCardsInfoWidget()
                  : c.index == 2
                      ? ProjectsScreen()
                      : c.index == 3 ? ConfigsScreen() : Container()),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        notchMargin: 2,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                iconSize: 30.0,
                /* 
                padding: EdgeInsets.only(left: 28.0), */
                icon: Icon(Icons.home),
                onPressed: () => c.changeIndex(0),
              ),
              IconButton(
                  iconSize: 30.0,
                  /* 
                padding: EdgeInsets.only(right: 28.0), */
                  icon: Icon(Icons.credit_card),
                  onPressed: () => c.changeIndex(1)),
              Container(),
              IconButton(
                iconSize: 30.0,
                /* 
                padding: EdgeInsets.only(left: 28.0), */
                icon: Icon(Icons.border_all),
                onPressed: () => c.changeIndex(2),
              ),
              IconButton(
                iconSize: 30.0,
                /* 
                padding: EdgeInsets.only(right: 28.0), */
                icon: Icon(Icons.settings),
                onPressed: () => c.changeIndex(3),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showDialogAdd(context),
        child: Icon(Icons.add),
      ),
    );
  }

  creditCardsInfoWidget() => LayoutBuilder(
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

  BottomNavigationBarItem bottomItem() =>
      BottomNavigationBarItem(icon: Icon(Icons.credit_card));
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
                            )),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      );
  showDialogAdd(BuildContext context) {
    cp.initiatePayment();
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) => AddNewPaymentWidget());
  }
}
