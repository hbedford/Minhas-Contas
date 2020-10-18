import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/models/card_model.dart';
import 'package:minhasconta/src/utils/bottomnavigation.dart';
import 'package:minhasconta/src/utils/compare.dart';
import 'package:minhasconta/src/widgets/card_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;

class HomeScreen1 extends StatefulWidget {
  @override
  _HomeScreen1State createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  List<CardModel> list = [
    CardModel(color: Colors.green),
    CardModel(color: Colors.blue),
    CardModel(color: Colors.red),
    CardModel(color: Colors.orange),
    null
  ];
  List cardsPositions;
  bool drag = false;
  ScrollController controller;
  final cc = GetIt.I.get<CardsController>();
  double v = 0;
  double size = 0;
  double pointer = 0;
  @override
  void initState() {
    super.initState();
    controller = ScrollController()
      ..addListener(() {
        if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          controller.animateTo(v - size,
              duration: Duration(milliseconds: 800), curve: Curves.easeOut);
        } else if (controller.position.userScrollDirection ==
            ScrollDirection.reverse) {
          controller.animateTo(v + size,
              duration: Duration(milliseconds: 800), curve: Curves.easeOut);
        }
        if (controller.offset != v) setState(() => v = controller.offset);
      });
  }

  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text('Dashboard', style: TextStyle(color: Colors.grey[400])),
      ),
      body: LayoutBuilder(
        builder: (context, constraint) => Stack(children: [
          cardsInfo(),
          Positioned(
            bottom: 0,
            child: Container(
              child: CurvedNavigationBar(
                key: _bottomNavigationKey,
                width: constraint.maxWidth,
                backgroundColor: Theme.of(context).bottomAppBarColor,
                animationDuration: Duration(milliseconds: 300),
                index: _page,
                onTap: (index) => setState(() => _page = index),
                items: [
                  Icon(
                    Platform.isAndroid
                        ? Icons.credit_card
                        : CupertinoIcons.creditcard,
                    color: Theme.of(context).accentColor,
                  ),
                  Icon(
                    Icons.home,
                    color: Theme.of(context).accentColor,
                  ),
                  Text('A'),
                  Text('A')
                ],
                height: constraint.maxHeight * 0.1,
              ),
            ),
          ),
        ]),
      ),
    );
  }

  cardsInfo() => LayoutBuilder(
        builder: (context, constraints) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  margin(
                      t: 0,
                      child: Text(
                        'Meus cartões',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      constraint: constraints),
                  cardsWidget(constraints),
                ])),
            Expanded(
                flex: 2,
                child: LayoutBuilder(
                  builder: (context, constraint) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      margin(
                          t: 3,
                          child: Text('Informações',
                              style: Theme.of(context).textTheme.subtitle1),
                          constraint: constraint),
                      margin(
                          t: 4,
                          child: loadContainer(
                              enable: cc.card == null,
                              bColor:
                                  Theme.of(context).textTheme.subtitle2.color,
                              child: Text('Saldo em conta',
                                  style:
                                      Theme.of(context).textTheme.subtitle2)),
                          constraint: constraint),
                      margin(
                          t: 2,
                          child: loadContainer(
                              child: Text(
                                'R\$250,00',
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              enable: cc.card == null,
                              bColor: Color(0xFF222059)),
                          constraint: constraint),
                      margin(
                          t: 4,
                          child: Row(children: [
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    margin(
                                        t: 2,
                                        l: 0,
                                        child: loadContainer(
                                            child: Text('Limite disponivel',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2),
                                            enable: cc.card == null,
                                            bColor: Theme.of(context)
                                                .textTheme
                                                .subtitle2
                                                .color),
                                        constraint: constraint),
                                    margin(
                                        t: 1,
                                        l: 0,
                                        child: loadContainer(
                                          child: Text('R\$1750,00',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline1),
                                          enable: cc.card == null,
                                          bColor: Color(0xFF222059),
                                        ),
                                        constraint: constraint)
                                  ]),
                            ),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    margin(
                                        t: 2,
                                        l: 0,
                                        child: loadContainer(
                                            child: Text('Credito utilizado',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle2),
                                            enable: cc.card == null,
                                            bColor: Colors.grey),
                                        constraint: constraint),
                                    margin(
                                        t: 1,
                                        l: 0,
                                        child: loadContainer(
                                          child: Text(
                                            'R\$250,00',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1,
                                          ),
                                          enable: cc.card == null,
                                          bColor: Color(0xFF222059),
                                        ),
                                        constraint: constraint)
                                  ]),
                            )
                          ]),
                          constraint: constraint),
                      margin(
                          t: 3,
                          child: cc.card == null
                              ? loadContainer(
                                  enable: cc.card == null,
                                  bColor: Colors.grey,
                                  child: Container(
                                    height: constraint.maxHeight * 0.01,
                                    width: constraint.maxWidth * 0.8,
                                  ))
                              : Container(
                                  child: Stack(
                                  children: [
                                    Container(
                                      height: constraint.maxHeight * 0.01,
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
                                      height: constraint.maxHeight * 0.01,
                                      width: constraint.maxWidth * 0.4,
                                    ),
                                  ],
                                )),
                          constraint: constraint),
                      margin(
                          t: 6,
                          child: Text('Ultimas compras',
                              style: Theme.of(context).textTheme.subtitle2),
                          constraint: constraint),
                      margin(
                          t: 2,
                          child: Container(
                              height: constraint.maxHeight * 0.3,
                              child: ListView.builder(
                                  itemCount: cc.card == null ? 3 : 2,
                                  itemBuilder: (context, int index) =>
                                      Container(
                                        height: constraint.maxHeight * 0.05,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Row(
                                                children: [
                                                  loadContainer(
                                                      child: Text(
                                                        'VXCase Digital LTDA.',
                                                      ),
                                                      enable: cc.card == null,
                                                      bColor: Colors.grey[700]),
                                                ],
                                              ),
                                            ),
                                            Flexible(
                                                flex: 2,
                                                child: Row(
                                                  children: [
                                                    loadContainer(
                                                        child: Text('Credito'),
                                                        enable: cc.card == null,
                                                        bColor: Colors.grey),
                                                  ],
                                                )),
                                            Flexible(
                                                flex: 2,
                                                child: Observer(
                                                  builder: (_) => Row(
                                                    children: [
                                                      loadContainer(
                                                          enable:
                                                              cc.card == null,
                                                          child:
                                                              Text('R\$250,00'),
                                                          bColor: Colors.green),
                                                    ],
                                                  ),
                                                ))
                                          ],
                                        ),
                                      ))),
                          constraint: constraint),
                    ],
                  ),
                ))
          ],
        ),
      );
  cardsWidget(BoxConstraints constraints) => Container(
      height: constraints.maxHeight * 0.3,
      width: constraints.maxWidth,
      child: Stack(
        children: list
            .map<Widget>((e) => card(list.indexOf(e), constraints, e))
            .toList()
            .reversed
            .toList(),
      ));
  card(int index, BoxConstraints constraint, CardModel card) {
    double w = constraint.maxWidth;
    double result;
    bool type = false;
    double dMargin = w * 0.05;
    double margin = (index * 15).toDouble();
    double cSize = w * 0.7;
    double pCard = cSize * index;
    //se for index 0
    if (index == 0) {
      if (cc.scroll < dMargin) {
        result = dMargin;
      } else
        result = -cc.scroll;
    } else {
      if (cc.scroll < pCard + 15 /* (-w * index) + dMargin */) {
        result = dMargin + margin;
      } else {
        result = (pCard + 15) - cc.scroll;
      }
    }

    return AnimatedPositioned(
        curve: Curves.easeOut,
        duration: Duration(milliseconds: 200),
        child: GestureDetector(
          onHorizontalDragStart: (d) {
            pointer = d.globalPosition.dx;
            cc.changeCard(null);
          },
          onHorizontalDragEnd: (d) {
            pointer = 0;
            Compare compare = Compare();
            setState(() {
              Map m =
                  compare.values(list.reversed.toList(), cc.scroll, w * 0.7);
              cc.changeScroll(m['scroll']);
              cc.changeCard(list[m['index']]);
            });
          },
          onHorizontalDragUpdate: (d) => setState(() {
            if (cc.scroll > -0.1) {
              if (cc.scroll - d.delta.dx < 0.0)
                cc.changeScroll(0.0);
              else if (cc.scroll + d.delta.dx > (w * 0.7) * list.length - 1) {
                cc.changeScroll(list.length * (w * 0.7));
              } else
                cc.changeScroll((cc.scroll - d.delta.dx));
            }
          }),
          child: card == null
              ? CardWidgetAdd(
                  constraint: constraint,
                  title: 'Adicionar cartão',
                  f: () => null)
              : CardWidget(
                  constraint: constraint,
                  card: card,
                ),
        ),
        left: !type ? result : null,
        right: type ? result : null);
  }

  loadContainer({Color bColor, bool enable = false, Widget child}) => Container(
        /* height: h, */
        /* width: w, */
        child: Shimmer.fromColors(
          baseColor: bColor,
          highlightColor: bColor.withOpacity(0.8),
          child: Container(
            color: enable ? bColor : Colors.transparent,
            child: child,
          ),
          enabled: enable,
          direction: ShimmerDirection.ltr,
        ),
      );
  margin({double t, double l, Widget child, BoxConstraints constraint}) =>
      Container(
        margin: EdgeInsets.only(
            left: l == null
                ? constraint.maxWidth * 0.05
                : constraint.maxWidth * (l / 100),
            top: constraint.maxHeight * (t / 100)),
        child: child,
      );
}
