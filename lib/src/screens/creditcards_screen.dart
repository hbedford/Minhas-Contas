import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';

import 'addcreditcard_screen.dart';

class CreditCardsScreen extends StatelessWidget {
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
              flex: 1,
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
                          '0 fisicos, 0 virtuais',
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCreditCardScreen())),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(left: constraint.maxWidth * 0.04),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => null,
                      child: Text('Cartões Fisicos'),
                    ),
                    InkWell(
                      onTap: () => null,
                      child: Text('Cartões Fisicos'),
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
                    itemCount: 2,
                    itemBuilder: (context, int index) => Container(
                          width: constraints.maxWidth * 0.8,
                          child: CreditCardWidget(),
                        )),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Observer(
                    builder: (_) => ListTile(
                      onTap: () => null,
                      title: Text('Alterar data de vencimento'),
                      trailing: Icon(Icons.arrow_forward_ios),
                    ),
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
