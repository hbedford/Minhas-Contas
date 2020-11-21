import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';

class CardViewWidget extends StatelessWidget {
  final c = GetIt.I.get<CardsController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 8,
        child: Card(
          child: Column(children: [Text(' aa')]),
          color: Colors.blue,
        ));
  }
}
