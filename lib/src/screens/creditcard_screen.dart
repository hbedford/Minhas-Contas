import 'package:flutter/material.dart';
import 'package:minhasconta/src/controllers/creditcard_controller.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';
import 'package:minhasconta/src/models/menu_model.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';

class CreditCardScreen extends StatelessWidget {
  final CreditCardModel creditCard;
  CreditCardScreen({this.creditCard});
  final List<MenuModel> menu = [
    MenuModel(icon: Icon(Icons.format_list_bulleted), name: 'Lista'),
    MenuModel(icon: Icon(Icons.insert_chart))
  ];
  final CreditCardController controller = CreditCardController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(15.0),
              children: [
                Container(
                  child: CreditCardWidget(
                    creditCard: creditCard,
                  ),
                ),
                /* Expanded(
                  flex: 4,
                  child: Column(children: [
                    /* Flexible(
              child: Row(
                children: menu
                    .map(
                      (e) => IconButton(
                        icon: e.icon,
                        onPressed: () =>
                            controller.changeActualWidget(listWidget()),
                      ),
                    )
                    .toList(),
              ),
            ),
            Expanded(child: controller.actualWidget ?? listWidget()) */
                  ]),
                ) */
              ]),
        ));
  }

  listWidget() => Column(children: []);
}
