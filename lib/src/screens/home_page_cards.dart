import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/models/card_model.dart';
import 'package:minhasconta/src/utils/compare.dart';
import 'package:minhasconta/src/widgets/addnewpayment_widget.dart';
import 'dart:ui' as ui;
import 'package:minhasconta/src/widgets/bubble_button_widget.dart';
import 'package:minhasconta/src/widgets/card_widget.dart';
import 'package:minhasconta/src/widgets/cardview_widget.dart';
import 'package:minhasconta/src/widgets/editcard_widget.dart';
import 'package:minhasconta/src/widgets/payment_popup_widget.dart';
import 'package:shimmer/shimmer.dart';

class HomePageCards extends StatefulWidget {
  @override
  _HomePageCardsState createState() => _HomePageCardsState();
}

class _HomePageCardsState extends State<HomePageCards> {
  ScrollController controller;
  final cc = GetIt.I.get<CardsController>();
  final c = GetIt.I.get<PaymentController>();
  double v = 0;
  double size = 0;
  double pointer = 0;
  double pos = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: LayoutBuilder(
          builder: (context, constraints) => Stack(children: [
                Observer(
                  builder: (_) => Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appBar(constraints),
                        title(constraints),
                        Visibility(child: cardsWidget(), visible: !cc.cardView),
                        Visibility(
                            visible: !cc.cardView,
                            child: cc.editCard != null
                                ? EditCardWidget()
                                : cardInfos(context)),
                        Visibility(
                            visible: cc.cardView, child: CardViewWidget())
                      ]),
                ),
                bubbleButton(constraints),
                Observer(
                  builder: (_) => c.payment != null
                      ? Positioned.fill(
                          child: InkWell(onTap: () => c.cancelPayment(context)))
                      : Container(),
                ),
                PaymentPopUpWidget(constraints: constraints)
              ])),
    );
  }

  bubbleButton(BoxConstraints constraints) => Visibility(
        visible: c.payment == null,
        child: Positioned(
          right: 0,
          top: constraints.maxHeight * 0.68,
          child: Observer(
            builder: (_) => Visibility(
              visible:
                  cc.card != null && cc.card.id != null && cc.editCard == null,
              child: SizedBox(
                  width: constraints.maxWidth * 0.13,
                  height: constraints.maxWidth * 0.18,
                  child: CustomPaint(
                      child: GestureDetector(
                        onTap: () {
                          final p = GetIt.I.get<PaymentController>();
                          p.initiatePayment();
                        },
                        /* onVerticalDragUpdate: (d) => setState(() {
                          print(pos + d.delta.dy);
                          if (pos + d.delta.dy >
                                  MediaQuery.of(context).size.height * 0.0 &&
                              pos + d.delta.dy <
                                  MediaQuery.of(context).size.height -
                                      MediaQuery.of(context)
                                          .viewInsets
                                          .bottom) {
                            pos = pos + d.delta.dy;
                          }
                        }), */
                        child: Container(
                          margin: EdgeInsets.only(
                              left: constraints.maxWidth * 0.02),
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      painter: BubbleWidget(color: cc.card.color))),
            ),
          ),
        ),
      );
  appBar(BoxConstraints constraints) => AnimatedContainer(
        duration: Duration(milliseconds: 200),
        child: Center(
          child: Text(
            'DASHBOARD',
            style:
                TextStyle(color: Colors.grey[400], fontWeight: FontWeight.w700),
          ),
        ),
        height: WidgetsBinding.instance.window.viewInsets.bottom == 0
            ? constraints.maxHeight * 0.08
            : 0,
      );
  title(BoxConstraints constraints) => Container(
      height: constraints.maxHeight *
          0.05 /*  +
          (WidgetsBinding.instance.window.viewInsets.bottom * 0.1) */
      ,
      width: constraints.maxWidth,
      child: LayoutBuilder(
          builder: (context, constraint) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AnimatedContainer(
                      height:
                          WidgetsBinding.instance.window.viewInsets.bottom == 0
                              ? null
                              : 0,
                      duration: Duration(milliseconds: 200),
                      child: margin(
                          t: 0,
                          child: Text(
                            cc.editCard == null
                                ? 'Meus cartões'
                                : 'Editar cartão',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                          constraint: constraint),
                    ),
                  ])));
  cardsWidget() => Expanded(
      flex: 1,
      child: LayoutBuilder(
          builder: (context, constraints) => Observer(
              builder: (_) => cc.cForList.length == 1 || cc.editCard != null
                  ? Container(
                      width: constraints.maxWidth,
                      margin: EdgeInsets.symmetric(
                          vertical: constraints.maxHeight * 0.02,
                          horizontal: constraints.maxWidth * 0.1),
                      child: Observer(
                        builder: (_) => CardWidget(
                          card: cc.editCard != null
                              ? cc.editCard
                              : cc.cForList.first,
                          f: () => cc.addNewCard(),
                          title: 'Novo cartão',
                          editing: true,
                        ),
                      ))
                  : SizedBox(
                      height: constraints.maxHeight * 0.3,
                      width: constraints.maxWidth,
                      child: Stack(
                          children: cc.cForList
                              .map<Widget>((e) =>
                                  card(cc.cForList.indexOf(e), constraints, e))
                              .toList()
                              .reversed
                              .toList()),
                    ))));
  cardInfos(BuildContext ctxt) => Expanded(
        flex: 2,
        child: LayoutBuilder(
          builder: (context, constraint) => Stack(
            children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                margin(
                    t: 3,
                    child: Text('Informações',
                        style: Theme.of(context).textTheme.subtitle1),
                    constraint: constraint),
                margin(
                    t: 4,
                    child: loadContainer(
                        enable: cc.card.name == null,
                        bColor: Theme.of(context).textTheme.subtitle2.color,
                        child: Text('Saldo em conta',
                            style: Theme.of(context).textTheme.subtitle2)),
                    constraint: constraint),
                margin(
                    t: 2,
                    child: loadContainer(
                        child: Text(
                          'R\$ ${cc.card.balance.toString().padLeft(2, '0')}',
                          style: Theme.of(context).textTheme.headline1,
                        ),
                        enable: cc.card.name == null,
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
                                      enable: cc.card.name == null,
                                      bColor: Theme.of(context)
                                          .textTheme
                                          .subtitle2
                                          .color),
                                  constraint: constraint),
                              margin(
                                  t: 1,
                                  l: 0,
                                  child: loadContainer(
                                    child: Text(
                                        'R\$ ${cc.card.name != null ? cc.card.limitDisponible : '00,00'}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
                                    enable: cc.card.name == null,
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
                                      enable: cc.card.name == null,
                                      bColor: Colors.grey),
                                  constraint: constraint),
                              margin(
                                  t: 1,
                                  l: 0,
                                  child: loadContainer(
                                    child: Text(
                                      cc.card != null
                                          ? cc.card.actualTotalLimit
                                          : 'R\$ 00,00',
                                      style:
                                          Theme.of(context).textTheme.headline1,
                                    ),
                                    enable: cc.card.name == null,
                                    bColor: Color(0xFF222059),
                                  ),
                                  constraint: constraint)
                            ]),
                      )
                    ]),
                    constraint: constraint),
                margin(
                    t: 3,
                    child: cc.card.name == null
                        ? loadContainer(
                            enable: cc.card.name == null,
                            bColor: Colors.grey,
                            child: Container(
                                height: constraint.maxHeight * 0.01,
                                width: (constraint.maxWidth * 0.9)))
                        : Container(
                            child: Stack(children: [
                            Container(
                                height: constraint.maxHeight * 0.01,
                                width: (constraint.maxWidth * 0.9),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white)),
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                height: constraint.maxHeight * 0.01,
                                width: cc.card.name != null
                                    ? (cc.card.totalThisMonthCredit /
                                            cc.card.limit) *
                                        (constraint.maxWidth * 0.9)
                                    : 0.0)
                          ])),
                    constraint: constraint),
                margin(
                    t: 6,
                    r: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Ultimas compras',
                            style: Theme.of(context).textTheme.subtitle2),
                        /*  Observer(
                                builder: (_) => Visibility(
                                  visible: cc.card.id != null && cc.editCard == null,
                                  child: InkWell(
                                      child: Icon(Icons.add),
                                      onTap: () {
                                        final p = GetIt.I.get<PaymentController>();
                                        p.initiatePayment();
                                        showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          context: ctxt,
                                          builder: (context) => AddNewPaymentWidget(),
                                        );
                                      }),
                                ),
                              ) */
                      ],
                    ),
                    constraint: constraint),
                margin(
                    t: 2,
                    child: Container(
                        height: constraint.maxHeight * 0.3,
                        child: cc.card.name != null &&
                                cc.card.pThisMonth.length == 0
                            ? Center(
                                child: Text('Nenhuma compra efetuada esse mês'),
                              )
                            : ListView.builder(
                                itemCount: cc.card.name == null
                                    ? 3
                                    : cc.card.pThisMonth.length,
                                itemBuilder: (context, int index) =>
                                    cc.card.name == null
                                        ? paymentWidget(
                                            constraint,
                                            'Testando testando',
                                            'Testando',
                                            'testando',
                                            true)
                                        : paymentWidget(
                                            constraint,
                                            cc.card.pThisMonth[index].name,
                                            cc.card.pThisMonth[index].type.name,
                                            'R\$ ' +
                                                cc.card.pThisMonth[index].value
                                                    .toString(),
                                            false))),
                    constraint: constraint)
              ]),
              Observer(
                builder: (_) => Visibility(
                  visible: c.payment != null,
                  child: ClipRect(
                    child: BackdropFilter(
                        filter: ui.ImageFilter.blur(
                          sigmaX: 5.0,
                          sigmaY: 5.0,
                        ),
                        child: Container(
                          height: constraint.maxHeight,
                          width: constraint.maxWidth,
                          decoration: BoxDecoration(
                              color: Colors.white10 /* .withOpacity(0.8) */),
                        )),
                  ),
                ),
              )
            ],
          ),
        ),
      );
  paymentWidget(BoxConstraints constraint, String title, String type,
          String price, bool loading) =>
      Container(
          height: constraint.maxHeight * 0.05,
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Expanded(
                flex: 4,
                child: Row(children: [
                  loadContainer(
                      child: Text(
                        title,
                      ),
                      enable: loading,
                      bColor: Colors.grey[700])
                ])),
            Flexible(
                flex: 2,
                child: Row(children: [
                  loadContainer(
                      child: Text(type), enable: loading, bColor: Colors.grey)
                ])),
            Flexible(
                flex: 2,
                child: Row(children: [
                  loadContainer(
                      enable: loading, child: Text(price), bColor: Colors.green)
                ]))
          ]));
  card(int index, BoxConstraints constraint, CardModel card) {
    double w = constraint.maxWidth;
    double h = constraint.maxHeight;
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
        child: Container(
          height: h * 0.9,
          width: w * 0.75,
          child: GestureDetector(
            onLongPress: () => cc.changeCardView(true),
            onTap: () {
              cc.changeCard(card);
              Navigator.pushNamed(context, '/card');
            },
            onHorizontalDragStart: (d) {
              if (cc.editCard == null) {
                pointer = d.globalPosition.dx;
                cc.changeCard(CardModel());
              }
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
            onHorizontalDragUpdate: (d) {
              if (cc.editCard == null) {
                setState(() {
                  if (cc.scroll > -0.1 &&
                      cc.scroll < (w * 0.75) * (cc.cForList.length - 1)) {
                    if (cc.scroll - d.delta.dx < 0.0)
                      cc.changeScroll(0.0);
                    else if (cc.scroll + d.delta.dx >
                        (w * 0.75) * (cc.cForList.length - 1)) {
                      cc.changeScroll(cc.cForList.length * (w * 0.75));
                    } else
                      cc.changeScroll((cc.scroll - d.delta.dx));
                  }
                });
              }
            },
            child: cc.cForList.indexOf(cc.cForList.last) == index
                ? CardWidget(
                    editing: cc.editCard != null ? true : false,
                    card: cc.editCard ?? CardModel(),
                    title: 'Adicionar cartão',
                    f: () => cc.addNewCard())
                : Observer(
                    builder: (_) => CardWidget(
                      card: card,
                      editing: cc.editCard == card,
                      f: () => cc.changeEditCard(card),
                    ),
                  ),
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
          direction: ShimmerDirection.ltr));
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
          child: child);
}
