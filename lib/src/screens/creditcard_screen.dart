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
        body: ListView(
      children: [
        Flexible(
            child: Center(
          child: CreditCardWidget(creditCard: creditCard),
        )),
        Flexible(child: Container())
      ],
    ));
  }

  listWidget() => Column(children: []);
}
