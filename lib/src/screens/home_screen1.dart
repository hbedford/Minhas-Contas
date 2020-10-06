import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';

import 'package:vector_math/vector_math.dart' show Vector3;

class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  List<CreditCardModel> list = [
    CreditCardModel(color: Colors.green),
    CreditCardModel(color: Colors.blue),
    CreditCardModel(color: Colors.red)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Dashboard', style: TextStyle(color: Colors.grey[400])),
        leading: Image.asset('assets/drawer.png'),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) => Column(
          children: [
            Text('Meus cartões'),
            cardsWidget(constraint),
            Text('Informações'),
            Text('Saldo em conta'),
            Text('R\$250,00'),
            Row(children: [
              Column(
                children: [Text('Limite disponivel'), Text('R\$1750,00')],
              ),
              Column(children: [Text('Credito utilizado'), Text('R\$250,00')])
            ]),
            Container(
                child: Stack(
              children: [
                Container(
                  height: constraint.maxHeight * 0.02,
                  width: constraint.maxWidth * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.green,
                  ),
                  height: constraint.maxHeight * 0.02,
                  width: constraint.maxWidth * 0.4,
                ),
              ],
            )),
            Text('Ultimas compras'),
            Container(
                height: constraint.maxHeight * 0.3,
                child: ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, int index) => Row(
                          children: [
                            Text(
                              'VXCase Digital LTDA.',
                            ),
                            Text('Credito'),
                            Text('R\$250,00')
                          ],
                        )))
          ],
        ),
      ),
    );
  }

  cardsWidget(BoxConstraints constraint) => Container(
        height: constraint.maxHeight * 0.3,
        width: constraint.maxWidth,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length + 1,
            itemBuilder: (context, int index) => SizedBox(
                  width: constraint.maxWidth * 0.7,
                  height: constraint.maxHeight * 0.16,
                  child: list.length == index
                      ? CardWidgetAdd(
                          title: 'Teste',
                          constraint: constraint,
                        )
                      : CardWidget(
                          card: list[index],
                          constraint: constraint,
                        ),
                )),
      );
}
