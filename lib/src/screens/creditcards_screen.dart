import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/creditcards_controller.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';

import 'addcreditcard_screen.dart';

class CreditCardsScreen extends StatelessWidget {
  final c = GetIt.instance<CreditCardsController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [IconButton(icon: Icon(Icons.settings), onPressed: null)],
      ),
      body: LayoutBuilder(
        builder: (context, constraint) => Column(
          children: [
            Flexible(
              flex: 2,
              child: Container(
                margin: EdgeInsets.only(left: constraint.maxWidth * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Cartões',
                          style: TextStyle(color: Colors.white, fontSize: 24),
                        ),
                        Text(
                          'Você tem ${c.creditCards.length} cart${c.creditCards.length == 1 ? 'ão' : 'ões'}',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCreditCardScreen())),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 4,
              child: LayoutBuilder(
                builder: (context, constraints) => ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: c.creditCards.length,
                    itemBuilder: (context, int index) => Container(
                          width: constraints.maxWidth * 0.8,
                          child: InkWell(
                              onLongPress: () => c.creditCards[index]
                                  .changeOptionsActive(
                                      !c.creditCards[index].optionsActive),
                              onTap: () {
                                c.changeCreditCard(c.creditCards[index]);
                                Navigator.pushNamed(context, '/card');
                              },
                              child: CreditCardWidget(
                                creditCard: c.creditCards[index],
                              )),
                        )),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  ListTile(
                    onTap: () => null,
                    title: Text('Alterar data de vencimento'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () => null,
                    title: Text('Alterar melhor data de compra'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    title: Text('Alterar limite'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(title: Text(''))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
