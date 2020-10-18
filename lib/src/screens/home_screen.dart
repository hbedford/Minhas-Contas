import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/home_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/home_pages/creditcards_page.dart';
import 'package:minhasconta/src/models/menu_model.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:minhasconta/src/screens/configs_screen.dart';
import 'package:minhasconta/src/screens/projects_screen.dart';
import 'package:minhasconta/src/widgets/addnewpayment_widget.dart';

class HomeScreen extends StatelessWidget {
  final c = GetIt.instance<HomeController>();
  final creditCardsController = GetIt.instance<CardsController>();
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
    return Observer(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: Text(
            'Minhas Contas',
            style: TextStyle(color: c.index == 0 ? Colors.white : Colors.black),
          ),
          centerTitle: true,
          backgroundColor: c.index == 0 ? Colors.blue : Colors.transparent,
          elevation: 0.0,
        ),
        body: body(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: bottomNavigation(),
        floatingActionButton: FloatingActionButton(
          onPressed: () => showDialogAdd(context),
          child: Icon(Icons.add),
        ),
      ),
    );
  }

  body() => LayoutBuilder(
        builder: (context, constraint) => Observer(
            builder: (_) => c.index == 0
                ? Stack(
                    children: [
                      Container(
                        color: Colors.blue,
                        height: constraint.maxHeight * 0.2,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: constraint.maxWidth * 0.04),
                        child: Column(
                          children: [
                            Flexible(
                              flex: 4,
                              child: Container(
                                height: constraint.maxHeight * 0.4,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        'Seja bem vindo(a) de volta',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                      ),
                                    ]),
                              ),
                            ),
                            Flexible(
                                flex: 7,
                                child: LayoutBuilder(
                                    builder: (context, constraints) => Card(
                                          elevation: 8,
                                          child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal:
                                                      constraints.maxWidth *
                                                          0.02,
                                                  vertical:
                                                      constraints.maxHeight *
                                                          0.02),
                                              height: constraints.maxHeight,
                                              width: constraints.maxWidth,
                                              child: Text('Ultima informação')),
                                        ))),
                            Spacer(
                              flex: 2,
                            ),
                            title('Ultimas despesas', () => null),
                            Spacer(
                              flex: 1,
                            ),
                            listWidget([1, 2, 3]),
                            Spacer(
                              flex: 1,
                            ),
                            title('Avisos', () => null),
                            Spacer(
                              flex: 1,
                            ),
                            listWidget([1, 2]),
                          ],
                        ),
                      ),
                    ],
                  )
                : c.index == 1
                    ? CreditCardsPage()
                    : c.index == 2
                        ? ProjectsScreen()
                        : c.index == 3 ? ConfigsScreen() : Container()),
      );
  bottomNavigation() => BottomAppBar(
        notchMargin: 5,
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 50,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              icon(icon: Icon(Icons.home), f: () => c.changeIndex(0)),
              icon(icon: Icon(Icons.credit_card), f: () => c.changeIndex(1)),
              Container(),
              icon(icon: Icon(Icons.border_all), f: () => c.changeIndex(2)),
              icon(icon: Icon(Icons.settings), f: () => c.changeIndex(3))
            ],
          ),
        ),
      );
  icon({Icon icon, Function f}) => IconButton(
        iconSize: 30.0,
        icon: icon,
        onPressed: f,
      );
  BottomNavigationBarItem bottomItem() =>
      BottomNavigationBarItem(icon: Icon(Icons.credit_card));

  showDialogAdd(BuildContext context) {
    cp.initiatePayment();
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (_) => AddNewPaymentWidget());
  }

  title(String title, Function f) => Flexible(
      flex: 5,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(title,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 16)),
        InkWell(onTap: f, child: Text('ver mais'))
      ]));
  listWidget(List l) => Flexible(
      flex: 6,
      child: LayoutBuilder(
        builder: (context, constraint) => ListView.builder(
            itemCount: l.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, int index) => Card(
                elevation: 2,
                child: Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: constraint.maxWidth * 0.02,
                        vertical: constraint.maxHeight * 0.01),
                    width: constraint.maxWidth * 0.4,
                    child: Text('Testando')))),
      ));
}
