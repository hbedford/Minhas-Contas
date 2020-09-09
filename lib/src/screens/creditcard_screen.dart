import 'package:flutter/material.dart';
import 'package:minhasconta/src/controllers/creditcard_controller.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';
import 'package:minhasconta/src/models/menu_model.dart';
import 'package:minhasconta/src/utils/converting_util.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';

import '../models/menu_model.dart';

class CreditCardScreen extends StatelessWidget {
  final CreditCardModel creditCard;
  CreditCardScreen({this.creditCard});
  final List<MenuModel> menu = [
    MenuModel(icon: Icon(Icons.format_list_bulleted), name: 'Lista'),
    MenuModel(
      icon: Icon(Icons.insert_chart),
    ),
    MenuModel(icon: Icon(Icons.settings))
  ];
  final CreditCardController controller = CreditCardController();

  @override
  Widget build(BuildContext context) {
    controller.changeActualWidget(listWidget());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text('Cartão de credito'),
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
                    Text("R\$" + creditCard.totalThisMonth.toString())
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
                        onPressed: () => null,
                      ),
                    )
                    .toList(),
              )),
          Flexible(
            flex: 8,
            child: Container(
              padding: EdgeInsets.all(20),
              child: controller.actualWidget,
              decoration: BoxDecoration(
                  color: Colors.black45,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
            ),
          ),
        ],
      ),
    );
  }
  //   controller.changeActualWidget(listWidget());
  //   return Scaffold(
  //       body: CustomScrollView(
  //     slivers: [
  //       SliverAppBar(
  //         floating: true,
  //         expandedHeight: 100,
  //         elevation: 0.0,
  //         backgroundColor: creditCard.color,
  //         collapsedHeight: 80,
  //       ),
  //       SliverFillRemaining(
  //           child: Padding(
  //         padding: const EdgeInsets.all(8.0),
  //         child: Column(
  //           children: [
  //             Flexible(
  //                 child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceAround,
  //               children: menu
  //                   .map(
  //                     (e) => IconButton(
  //                       icon: e.icon,
  //                       onPressed: () => null,
  //                     ),
  //                   )
  //                   .toList(),
  //             )),
  //             Flexible(child: controller.actualWidget)
  //           ],
  //         ),
  //       ))
  //     ],
  //   ));
  // }

  Widget listWidget() {
    Converting converting = Converting();
    List<Widget> list = [];
    creditCard.paymentsPerDate.map((element) {
      print(element.payments.length);
      list.add(
        Row(
          children: [
            Text(converting.dateIsToday(element.date)
                ? 'Hoje'
                : converting.dateDMtoS(element.date))
          ],
        ),
      );
      element.payments.forEach((e) {
        print(e.name);
        return list.add(ListTile(
          // leading: Icon(e.categories[0]),
          title: Text(e.name),
          trailing: Text(
            e.tPayment ? '+' : '-' + "R\$" + e.value.toString(),
            style: TextStyle(color: e.tPayment ? Colors.green : Colors.red),
          ),
        ));
      });
    }).toList();

    return Column(children: list);
  }
}
