import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/creditcard_model.dart';

class CreditCardWidget extends StatelessWidget {
  final CreditCardModel creditCard;
  CreditCardWidget({this.creditCard});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: creditCard.color),
    );
  }
}
