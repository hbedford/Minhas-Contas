import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/creditcards_controller.dart';
import 'package:minhasconta/src/controllers/home_controller.dart';
import 'package:minhasconta/src/screens/creditcard_screen.dart';
import 'package:minhasconta/src/screens/creditcards_screen.dart';
import 'package:minhasconta/src/widgets/creditcard_widget.dart';
import 'dart:math' as math;

class CreditCardsPage extends StatelessWidget {
  final c = GetIt.instance<HomeController>();
  final creditCardsController = GetIt.instance<CreditCardsController>();
  static Matrix4 _pmat(num pv) {
    return new Matrix4(
      1.0, 0.0, 0.0, 0.0, //
      0.0, 1.0, 0.0, 0.0, //
      0.0, 0.0, 1.0, pv * 0.001, //
      0.0, 0.0, 0.0, 1.0,
    );
  }

  final _pageController = PageController(
    viewportFraction: 0.2,
  );
  ScrollController scroll = ScrollController();
  Matrix4 perspective = _pmat(1.0);
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => ListView.builder(
        controller: _pageController,
        itemBuilder: (context, int index) => AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            /* double value = 1.6;

            if (_pageController.position.haveDimensions) {
              value = _pageController.page - index;

              if (value >= 0) {
                double _lowerLimit = 0 + 1.55;
                double _upperLimit = pi / 2;

                value =
                    (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit)))
                        .clamp(_lowerLimit, _upperLimit);
                value = _upperLimit - value;
                value *= -1;
              }
            } else {
              if (index == 0) {
                value = 0;
              } else if (index == 1) {
                value = 2;
              }
            } */

            double value = 1.6;
            if (_pageController.position.haveDimensions) {
              //trocar o 0 para se esse child é o index atual
              if (_pageController.position.pixels == 0 && index == 0) {
                value = 180;
              } else {
                value = _pageController.page - index + 120;
              }
            } else
              value = 0;
            return Center(
                child: Transform(
                    transform:
                        /*  Matrix4.identity()
                      ..setEntry(3, 1, 0)
                      ..rotateX(
                          value) */
                        perspective.scaled(1.0, 2.0, 1.0)
                          ..rotateX(math.pi - value * math.pi / 180)
                          ..rotateY(0.0)
                          ..rotateZ(0.0),
                    child: child));
          },
          child: CreditCardWidget(
              creditCard: creditCardsController.creditCards[0]),
        ),
      ),
    );
  }

  /*  _builder(int index, BoxConstraints constraint) {
    /* CreditCard _card = _creditCards[index]; */
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1.6;

        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;

          if (value >= 0) {
            double _lowerLimit = 0 + 1.55;
            double _upperLimit = pi / 2;

            value = (_upperLimit - (value.abs() * (_upperLimit - _lowerLimit)))
                .clamp(_lowerLimit, _upperLimit);
            value = _upperLimit - value;
            value *= -1;
          }
        } else {
          if (index == 0) {
            value = 0;
          } else if (index == 1) {
            value = 2;
          }
        }

        return Center(
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 1, 0)
              ..rotateX(value),
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
      child: Container(
          child: CreditCardWidget(
        creditCard: creditCardsController.creditCards[0],
        constrainedBox: constraint,
      )),
    );
  } */
  /* @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => SingleChildScrollView(
        controller: scroll,
        child: Container(
          height: constraint.maxHeight,
          child: Stack(
            children: List<Widget>.generate(
              10,
              (int index) => Container(
                  margin: EdgeInsets.only(
                      top: (constraint.maxHeight * 0.1) * index),
                  transform: perspective.scaled(1.0, 1.0, 1.0)
                    ..rotateX(math.pi - 133 * math.pi / 180)
                    ..rotateY(0.0)
                    ..rotateZ(0.0),
                  child: CreditCardWidget(
                    creditCard: creditCardsController.creditCards[0],
                    constrainedBox: constraint,
                  )),
            ),
          ),
        ),
      ),
    ); */

  /* LayoutBuilder(
      builder: (context, constraint) => Stack(
        children: [
          
          /* bottomMenu(constraint), */
          /*  Container(
            height: constraint.maxHeight * 0.1,
          ),
          Column(
            children: [
              Flexible(child: Container()),
              creditCardsInfo(constraint, context),
              Flexible(
                  child: LayoutBuilder(
                builder: (c, constraints) => Container(),
              ))
            ],
          ),
          Observer(
              builder: (_) => Visibility(
                  visible: c.actionButton,
                  child: Positioned(
                      bottom: constraint.maxHeight * 0.2,
                      right: constraint.maxWidth * 0.1,
                      child: Row(children: [
                        Text('Gasto/Ganho'),
                        IconButton(
                            icon: Icon(Icons.payment), onPressed: () => null)
                      ])))) */
        ],
      ),
    ); */
  /*  } */
/* 
  creditCardsInfo(BoxConstraints constraint, BuildContext context) => Flexible(
        child: Column(
          children: [
            Flexible(
              child: Container(
                margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cartões',
                      style: TextStyle(),
                    ),
                    FlatButton(
                      child: Text('ver detalhes'),
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreditCardsScreen(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: LayoutBuilder(
                builder: (c, constraints) => ListView(
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: creditCardsController.creditCards
                      .map(
                        (e) => InkWell(
                            onTap: () {
                              creditCardsController.changeCreditCard(e);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CreditCardScreen()));
                            },
                            child: CreditCardWidget(
                              creditCard: e,
                              constrainedBox: constraints,
                            )),
                      )
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ); */
}
