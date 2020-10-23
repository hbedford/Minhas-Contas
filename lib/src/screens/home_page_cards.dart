import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/models/card_model.dart';
import 'package:minhasconta/src/utils/compare.dart';
import 'package:minhasconta/src/widgets/card_widget.dart';
import 'package:minhasconta/src/widgets/selectcolor_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomePageCards extends StatefulWidget {
  @override
  _HomePageCardsState createState() => _HomePageCardsState();
}

class _HomePageCardsState extends State<HomePageCards> {
  bool showTxtEditingLimit = false;
  TextEditingController limit = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  ScrollController controller;
  final cc = GetIt.I.get<CardsController>();
  double v = 0;
  double size = 0;
  double pointer = 0;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: constraints.maxHeight * 0.3 +
                          (WidgetsBinding.instance.window.viewInsets.bottom *
                              0.1),
                      width: constraints.maxWidth,
                      child: LayoutBuilder(
                        builder: (context, constraint) => Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              margin(
                                  t: 0,
                                  child: Text(
                                    'Meus cartões',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  constraint: constraint),
                              cardsWidget()
                            ]),
                      )),
                  Observer(
                      builder: (_) =>
                          cc.newCard != null ? newCardWidget() : cardInfos()),
                ]));
  }

  cardsWidget() => Expanded(
        child: LayoutBuilder(
            builder: (context, constraints) => Observer(
                builder: (_) => cc.cForList.length == 1
                    ? Container(
                        width: constraints.maxWidth,
                        margin: EdgeInsets.symmetric(
                            vertical: constraints.maxHeight * 0.02,
                            horizontal: constraints.maxWidth * 0.1),
                        child: Observer(
                          builder: (_) => CardWidget(
                              card: cc.newCard != null ? cc.newCard : null,
                              f: () => cc.addNewCard(),
                              title: 'Novo cartão'),
                        ))
                    : Stack(
                        children: cc.cForList
                            .map<Widget>((e) =>
                                card(cc.cForList.indexOf(e), constraints, e))
                            .toList()
                            .reversed
                            .toList()))),
      );
  cardInfos() => Expanded(
      flex: 2,
      child: LayoutBuilder(
          builder: (context, constraint) =>
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                margin(
                    t: 3,
                    child: Text('Informações',
                        style: Theme.of(context).textTheme.subtitle1),
                    constraint: constraint),
                margin(
                    t: 4,
                    child: loadContainer(
                        enable: cc.card == null,
                        bColor: Theme.of(context).textTheme.subtitle2.color,
                        child: Text('Saldo em conta',
                            style: Theme.of(context).textTheme.subtitle2)),
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
                                      style:
                                          Theme.of(context).textTheme.headline1,
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
                                              builder: (_) => Row(children: [
                                                    loadContainer(
                                                        enable: cc.card == null,
                                                        child:
                                                            Text('R\$250,00'),
                                                        bColor: Colors.green)
                                                  ])))
                                    ])))),
                    constraint: constraint)
              ])));
  newCardWidget() => Expanded(
      flex: 2,
      child: LayoutBuilder(
          builder: (context, constraint) =>
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                margin(
                    t: 3,
                    child: Text('Informações',
                        style: Theme.of(context).textTheme.subtitle1),
                    constraint: constraint),
                margin(
                  t: 3,
                  r: 5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: constraint.maxWidth * 0.6,
                            child: TextField(
                              controller: name,
                              onChanged: (v) => cc.newCard.changeName(v),
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  labelText: 'Nome do cartão'),
                            ),
                          ),
                          Container(
                            width: constraint.maxWidth * 0.2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Cor:'),
                                InkWell(
                                  onTap: () => SelectColor().showDialogColor(
                                      context,
                                      (v) => cc.newCard.changeColor(v)),
                                  child: CircleAvatar(
                                    backgroundColor: cc.newCard.color,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Divider(),
                      Row(
                        children: [
                          Flexible(
                              child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Numero do cartão'),
                          ))
                        ],
                      ),
                      Divider(),
                      Container(
                        height: constraint.maxHeight * 0.13,
                        width: constraint.maxWidth,
                        child: Stack(
                          children: [
                            AnimatedPositioned(
                                duration: Duration(milliseconds: 200),
                                left: showTxtEditingLimit
                                    ? -constraint.maxWidth
                                    : 0,
                                child: SizedBox(
                                  width: constraint.maxWidth * 0.9,
                                  child: ListTile(
                                      onTap: () => setState(() =>
                                          showTxtEditingLimit =
                                              !showTxtEditingLimit),
                                      title: Text(
                                        'Limite',
                                      ),
                                      trailing: Text('R\$' +
                                          (cc.newCard.limit
                                              .toStringAsFixed(2)))),
                                )),
                            AnimatedPositioned(
                                duration: Duration(milliseconds: 200),
                                right: showTxtEditingLimit
                                    ? 0
                                    : -constraint.maxWidth,
                                child: SizedBox(
                                    width: constraint.maxWidth * 0.9,
                                    child: Row(
                                      children: [
                                        Flexible(
                                            child: TextField(
                                          decoration: InputDecoration(
                                              suffixIcon: IconButton(
                                                  icon: Icon(Icons.save),
                                                  onPressed: () {
                                                    setState(() {
                                                      cc.newCard.changeLimit(
                                                          double.parse(
                                                              limit.text));
                                                      showTxtEditingLimit =
                                                          false;
                                                    });
                                                  }),
                                              prefixIcon: IconButton(
                                                  icon: Icon(Icons.arrow_back,
                                                      color: Colors.blue),
                                                  onPressed: () => setState(() =>
                                                      showTxtEditingLimit =
                                                          !showTxtEditingLimit)),
                                              border: OutlineInputBorder(),
                                              hintText: 'Limite'),
                                        )),
                                      ],
                                    ))),
                          ],
                        ),
                      )
                    ],
                  ),
                  constraint: constraint,
                ),
                Divider(),
              ])));
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
      if (cc.scroll < dMargin)
        result = dMargin;
      else
        result = -cc.scroll;
    } else {
      if (cc.scroll < pCard + 15 /* (-w * index) + dMargin */)
        result = dMargin + margin;
      else
        result = (pCard + 15) - cc.scroll;
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
              Map m = compare.values(
                  cc.cForList.reversed.toList(), cc.scroll, w * 0.7);
              cc.changeScroll(m['scroll']);
              cc.changeCard(cc.cForList[m['index']]);
            });
          },
          onHorizontalDragUpdate: (d) => setState(() {
            if (cc.scroll > -0.1) {
              if (cc.scroll - d.delta.dx < 0.0)
                cc.changeScroll(0.0);
              else if (cc.scroll + d.delta.dx >
                  (w * 0.7) * cc.cForList.length - 1) {
                cc.changeScroll(cc.cForList.length * (w * 0.7));
              } else
                cc.changeScroll((cc.scroll - d.delta.dx));
            }
          }),
          child: card == null
              ? CardWidget(title: 'Adicionar cartão', f: () => cc.addNewCard())
              : CardWidget(
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
  margin(
          {double t = 0,
          double l,
          double r = 0,
          Widget child,
          BoxConstraints constraint}) =>
      Container(
        margin: EdgeInsets.only(
            right: (r / 100) * constraint.maxWidth ?? 0,
            left: l == null
                ? constraint.maxWidth * 0.05
                : constraint.maxWidth * (l / 100),
            top: constraint.maxHeight * (t / 100)),
        child: child,
      );
}
