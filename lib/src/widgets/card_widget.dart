import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:minhasconta/src/models/card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final Function f;
  final String title;
  CardWidget({this.card, this.f, this.title});
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Observer(
          builder: (_) => AnimatedContainer(
            duration: Duration(milliseconds: 200),
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * 0.05,
                horizontal: constraints.maxWidth * 0.05),
            margin: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.01,
                vertical: constraints.maxHeight * 0.07),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: card == null ? Colors.white : card.color),
            child: card == null
                ? InkWell(
                    onTap: f,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.add),
                          Text(title),
                        ]),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Observer(
                                builder: (_) => Text(card.name,
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w800)),
                              ),
                              IconButton(
                                  icon: Icon(Icons.settings), onPressed: null)
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
                              child: Text(card.number01),
                            ),
                            Container(
                              height: 10,
                              width: 30,
                              color: Colors.white,
                              child: Text(card.number02),
                            ),
                            Container(
                              height: 10,
                              width: 30,
                              color: Colors.white,
                              child: Text(card.number03),
                            ),
                            Container(
                              height: 10,
                              width: 30,
                              color: Colors.white,
                              child: Text(card.number04),
                            ),
                            Icon(Icons.visibility)
                          ],
                        ),
                      ]),
          ),
        ),
      );
}

/* class CardWidgetAdd extends StatelessWidget {
  final Function f;
  final String title;
  final BoxConstraints constraint;
  CardWidgetAdd({this.f, this.title, this.constraint});
  @override
  Widget build(BuildContext context) {
    double h = constraint.maxHeight;
    double w = constraint.maxWidth;
    return AnimatedContainer(
      duration: Duration(microseconds: 200),
      height: h * 0.25,
      width: w * 0.7,
      padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.05),
      margin: EdgeInsets.symmetric(horizontal: w * 0.01, vertical: h * 0.03),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: InkWell(
        onTap: f,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.add),
              Text(title),
            ]),
      ),
    );
  }
} */

/* class EditCardWidget extends StatelessWidget {
  final BoxConstraints constraint;
  EditCardWidget({this.constraint});
  final c = GetIt.I.get<CardsController>();
  @override
  Widget build(BuildContext context) {
    double h = constraint.maxHeight;
    double w = constraint.maxWidth;
    return Container(
      height: h * 0.25,
      width: w * 0.7,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: c.newCard.color,
      ),
      padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.05),
      margin: EdgeInsets.symmetric(horizontal: w * 0.01, vertical: h * 0.03),
    );
  }
} */
