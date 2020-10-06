/* import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';

class CardWidget extends StatelessWidget {
  final CreditCardModel creditCard;
  final BoxConstraints constrainedBox;
  CardWidget({this.creditCard, this.constrainedBox});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, constraint) => Container(
        margin: EdgeInsets.symmetric(
            horizontal:
                constrainedBox != null ? constrainedBox.maxWidth * 0.02 : 10),
        padding: EdgeInsets.symmetric(
            vertical:
                constrainedBox != null ? constrainedBox.maxWidth * 0.02 : 10,
            horizontal:
                constrainedBox != null ? constrainedBox.maxWidth * 0.03 : 10),
        height: constrainedBox != null
            ? constrainedBox.maxWidth * 0.3
            : constraint.maxWidth * 0.3,
        width: constrainedBox != null
            ? constrainedBox.maxWidth * 0.7
            : constraint.maxWidth * 0.8,
        decoration: BoxDecoration(
            color: creditCard != null ? creditCard.color : Colors.white,
            borderRadius: BorderRadius.circular(15)),
        child: Stack(
          children: [
            Center(
                child: Text(
              'Minhas contas',
              style: TextStyle(color: Colors.white10),
            )),
            Column(children: [
              Row(
                children: [
                  Text(
                    creditCard != null ? creditCard.name : ' ',
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
 */
import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';

class CardWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final card;
  CardWidget({this.constraint, this.card});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: constraint.maxHeight * 0.02,
          horizontal: constraint.maxWidth * 0.05),
      margin: EdgeInsets.symmetric(
          horizontal: constraint.maxWidth * 0.01,
          vertical: constraint.maxHeight * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: card.color,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Inter',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w800),
              ),
              IconButton(icon: Icon(Icons.settings), onPressed: null)
            ]),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('debito'), Text('credito')]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 10,
                  width: 30,
                  color: Colors.white,
                ),
                Container(
                  height: 10,
                  width: 30,
                  color: Colors.white,
                ),
                Container(
                  height: 10,
                  width: 30,
                  color: Colors.white,
                ),
                Icon(Icons.visibility)
              ],
            ),
          ]),
    );
  }
}

class CardWidgetAdd extends StatelessWidget {
  final Function f;
  final String title;
  final BoxConstraints constraint;
  CardWidgetAdd({this.f, this.title, this.constraint});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: constraint.maxHeight * 0.02,
          horizontal: constraint.maxWidth * 0.05),
      margin: EdgeInsets.symmetric(
          horizontal: constraint.maxWidth * 0.01,
          vertical: constraint.maxHeight * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add),
            Text(title),
          ]),
    );
  }
}
