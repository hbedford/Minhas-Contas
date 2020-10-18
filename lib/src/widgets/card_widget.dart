import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final card;
  CardWidget({this.constraint, this.card});
  @override
  Widget build(BuildContext context) {
    double h = constraint.maxHeight;
    double w = constraint.maxWidth;
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      height: h * 0.25,
      width: w * 0.7,
      padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.05),
      margin: EdgeInsets.symmetric(horizontal: w * 0.01, vertical: h * 0.03),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: card.color),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text('Inter',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800)),
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
