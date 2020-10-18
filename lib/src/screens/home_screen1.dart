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
      body: cardsInfo(),
      /* bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        backgroundColor: Colors.transparent,
        animationDuration: Duration(milliseconds: 300),
        index: _page,
        onTap: (index) => setState(() => _page = index),
        items: [Icon(Icons.person), Text('A'), Text('A'), Text('A')],
        height: 50,
      ), */
    );
  }

  cardsInfo() => LayoutBuilder(
        builder: (context, constraint) => Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            margin(Text('Meus cartões'), constraint),
            cardsWidget(constraint),
            margin(Text('Informações'), constraint),
            margin(
                cc.card != null
                    ? Text('Saldo em conta')
                    : loadContainer(
                        h: constraint.maxHeight * 0.025,
                        w: constraint.maxWidth * 0.25,
                        bColor: Theme.of(context).secondaryHeaderColor),
                constraint),
            margin(
                cc.card != null
                    ? Text('R\$250,00')
                    : loadContainer(
                        h: constraint.maxHeight * 0.04,
                        w: constraint.maxWidth * 0.3,
                        bColor: Color(0xFF222059),
                      ),
                constraint),
            margin(
                cc.card != null
                    ? Row(children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Limite disponivel'),
                              Text('R\$1750,00')
                            ],
                          ),
                        ),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Credito utilizado'),
                                Text('R\$250,00')
                              ]),
                        )
                      ])
                    : Row(
                        children: [
                          Expanded(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  loadContainer(
                                      h: constraint.maxHeight * 0.025,
                                      w: constraint.maxWidth * 0.25,
                                      bColor: Theme.of(context)
                                          .secondaryHeaderColor),
                                  Container(
                                    height: constraint.maxHeight * 0.01,
                                  ),
                                  loadContainer(
                                    h: constraint.maxHeight * 0.04,
                                    w: constraint.maxWidth * 0.3,
                                    bColor: Color(0xFF222059),
                                  ),
                                ]),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                loadContainer(
                                    h: constraint.maxHeight * 0.025,
                                    w: constraint.maxWidth * 0.25,
                                    bColor: Colors.grey),
                                Container(
                                  height: constraint.maxHeight * 0.01,
                                ),
                                loadContainer(
                                  h: constraint.maxHeight * 0.04,
                                  w: constraint.maxWidth * 0.3,
                                  bColor: Color(0xFF222059),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                constraint),
            margin(
                cc.card != null
                    ? Container(
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
                      ))
                    : loadContainer(
                        h: constraint.maxHeight * 0.02,
                        w: constraint.maxWidth * 0.8,
                        bColor: Colors.grey),
                constraint),
            margin(Text('Ultimas compras'), constraint),
            margin(
                Container(
                    height: constraint.maxHeight * 0.3,
                    child: ListView.builder(
                        itemCount: cc.card != null ? 3 : 2,
                        itemBuilder: (context, int index) => Container(
                              height: constraint.maxHeight * 0.05,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Row(
                                      children: [
                                        cc.card != null
                                            ? Text(
                                                'VXCase Digital LTDA.',
                                              )
                                            : loadContainer(
                                                h: constraint.maxHeight * 0.02,
                                                w: constraint.maxWidth * 0.4,
                                                bColor: Colors.grey[700]),
                                      ],
                                    ),
                                  ),
                                  Flexible(
                                      flex: 2,
                                      child: Row(
                                        children: [
                                          cc.card != null
                                              ? Text('Credito')
                                              : loadContainer(
                                                  h: constraint.maxHeight *
                                                      0.02,
                                                  w: constraint.maxWidth * 0.15,
                                                  bColor: Colors.grey),
                                        ],
                                      )),
                                  Flexible(
                                      flex: 2,
                                      child: Observer(
                                        builder: (_) => Row(
                                          children: [
                                            cc.card != null
                                                ? Text('R\$250,00')
                                                : loadContainer(
                                                    h: constraint.maxHeight *
                                                        0.02,
                                                    w: constraint.maxWidth *
                                                        0.18,
                                                    bColor: Colors.green),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ))),
                constraint),
            Container(
              child: CurvedNavigationBar(
                key: _bottomNavigationKey,
                width: constraint.maxWidth,
                backgroundColor: Colors.transparent,
                animationDuration: Duration(milliseconds: 300),
                index: _page,
                onTap: (index) => setState(() => _page = index),
                items: [Icon(Icons.person), Text('A'), Text('A'), Text('A')],
                height: constraint.maxHeight * 0.08,
              ),
            ),
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
      )

      /* SingleChildScrollView(
          child: SizedBox(
              height: constraint.maxHeight,
              width: constraint.maxWidth * list.length,
              child: Stack(
                  children: list
                      .map<Widget>((e) => card(list.indexOf(e), constraint, e))
                      .toList()
                      .reversed
                      .toList() /* [
                card(2, constraint, Colors.red),
                card(1, constraint, Colors.blue),
                card(0, constraint, Colors.green),
              ]), */
                  )),
          controller: controller,
          /* physics: PageScrollPhysics(), */
          scrollDirection: Axis.horizontal,
        ), */
      );
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

  loadContainer({
    @required double h,
    @required double w,
    @required Color bColor,
  }) =>
      Container(
        height: h,
        width: w,
        child: Shimmer.fromColors(
          baseColor: bColor,
          highlightColor: bColor.withOpacity(0.8),
          child: Container(
            color: bColor,
          ),
          enabled: true,
          direction: ShimmerDirection.ltr,
        ),
      );
  margin(Widget child, BoxConstraints constraint) => Container(
        margin: EdgeInsets.only(left: constraint.maxWidth * 0.05),
        child: child,
      );
}
