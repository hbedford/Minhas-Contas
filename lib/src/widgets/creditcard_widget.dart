import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCardModel creditCard;
  final BoxConstraints constrainedBox;
  CreditCardWidget({this.creditCard, this.constrainedBox});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (c, constraint) => Container(
        margin:
            EdgeInsets.symmetric(horizontal: constrainedBox.maxWidth * 0.02),
        padding: EdgeInsets.symmetric(
            vertical: constrainedBox.maxWidth * 0.01,
            horizontal: constrainedBox.maxWidth * 0.02),
        height: constrainedBox != null
            ? constrainedBox.maxWidth * 0.3
            : constraint.maxWidth * 0.3,
        width: constrainedBox != null
            ? constrainedBox.maxWidth * 0.7
            : constraint.maxWidth * 0.8,
        decoration: BoxDecoration(
            color: creditCard.color, borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          Row(
            children: [Text(creditCard.name)],
          )
        ]),
      ),
    );
  }
}
