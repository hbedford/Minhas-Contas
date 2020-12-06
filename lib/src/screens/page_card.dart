import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/card_controller.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:shimmer/shimmer.dart';

class PageCard extends StatelessWidget {
  final BoxConstraints constraint;
  PageCard({this.constraint});
  final c = GetIt.I.get<CardsController>();
  final cc = GetIt.I.get<CardController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        appBar(),
        Divider(
          color: Colors.white,
        ),
        margin(
            t: 2,
            child: Row(
              children: [
                Text(
                  'Meus Cartões',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Observer(
                    builder: (_) => Text(
                        (c.cards.indexOf(c.card) + 1).toString() +
                            '/' +
                            c.cards.length.toString()))
              ],
            ),
            constraints: constraint),
        margin(
            constraints: constraint,
            l: 0,
            t: 2,
            child: Container(
                height: constraint.maxHeight * 0.7,
                width: constraint.maxWidth * 0.9999,
                decoration: BoxDecoration(
                    color: c.card.color,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    margin(
                        t: 0,
                        child: cardBasicInfo(constraint, context),
                        constraints: constraint),
                    barDays(constraint, context),
                    margin(
                      constraints: constraint,
                      l: 0,
                      t: 2,
                      child: Text(
                        'Classificar por',
                        style: Theme.of(context)
                            .textTheme
                            .headline6
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    listPayments()
                  ],
                ))),
      ],
    );
  }

  appBar() => Container(
        height: constraint.maxHeight * 0.08,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: null),
            Text('Cartões'),
            IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: null),
          ],
        ),
      );
  listPayments() => margin(
        constraints: constraint,
        t: 2,
        child: Container(
            height: constraint.maxHeight * 0.3,
            child: c.card.name != null && c.card.pThisMonth.length == 0
                ? Center(
                    child: Text(
                      'Nenhuma compra efetuada esse mês',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                : ListView.builder(
                    itemCount: c.card.name == null ? 3 : cc.payments.length,
                    itemBuilder: (context, int index) => c.card.name == null
                        ? paymentWidget(constraint, 'Testando testando',
                            'Testando', 'testando', true)
                        : paymentWidget(
                            constraint,
                            cc.payments[index].name,
                            cc.payments[index].type.name,
                            'R\$ ' + cc.payments[index].value.toString(),
                            false))),
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
  loadContainer({Color bColor, bool enable = false, Widget child}) => Container(
      child: Shimmer.fromColors(
          baseColor: bColor,
          highlightColor: bColor.withOpacity(0.8),
          child: Container(
            color: enable ? bColor : Colors.transparent,
            child: child,
          ),
          enabled: enable,
          direction: ShimmerDirection.ltr));
  cardBasicInfo(BoxConstraints constraints, BuildContext context) => Container(
      padding: EdgeInsets.symmetric(
          vertical: constraints.maxHeight * 0.02,
          horizontal: constraints.maxWidth * 0.15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: c.card.color),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Observer(
                  builder: (_) => Text(c.card.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline2
                          .copyWith(fontSize: 32))),
              Row(
                children: [
                  IconButton(
                      color: Colors.white,
                      icon: Icon(Icons.settings),
                      onPressed: () => null),
                  IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: () => c.changeCardFullInfo(false))
                ],
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Observer(
                    builder: (_) => Visibility(
                      visible: c.card.debit,
                      child: Text(
                        'Debito',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  ),
                  Observer(
                    builder: (_) => Visibility(
                      visible: c.card.credit,
                      child: Text(
                        'Credito',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    ),
                  )
                ]),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Observer(
                  builder: (_) => Container(
                    color: c.card.show ? null : Colors.white,
                    child: Text(
                      c.card.number01,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Container(
                    color: c.card.show ? null : Colors.white,
                    child: Text(
                      c.card.number02,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Container(
                    color: c.card.show ? null : Colors.white,
                    child: Text(
                      c.card.number03,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => Container(
                    color: c.card.show ? null : Colors.white,
                    child: Text(
                      c.card.number04,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
                Observer(
                  builder: (_) => IconButton(
                      color: Colors.white,
                      icon: Icon(c.card.show
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () => c.card.changeShow(!c.card.show)),
                )
              ],
            ),
          ]));
  barDays(BoxConstraints constraint, BuildContext context) => Container(
        height: constraint.maxHeight * 0.05,
        width: constraint.maxWidth * 0.98,
        child: Stack(
          children: [
            Positioned.fill(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.grey[400],
                  borderRadius: BorderRadius.circular(8)),
              child: Observer(
                builder: (_) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: cc.days
                      .map((e) => InkWell(
                            onTap: () => cc.changeDay(e),
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 100),
                              height: constraint.maxHeight * 0.05,
                              width: (constraint.maxWidth * 0.8 / 6) +
                                  (e == cc.day
                                      ? constraint.maxWidth * 0.15
                                      : 0.0),
                              child: Center(
                                child: AnimatedOpacity(
                                  opacity: cc.day == e ? 0.0 : 1.0,
                                  duration: Duration(microseconds: 2000),
                                  child: Text(
                                    e,
                                    style: TextStyle(color: Colors.grey[600]),
                                  ),
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ),
            )),
            Observer(
              builder: (_) => AnimatedPositioned(
                  left: (constraint.maxWidth * 1.8) *
                      cc.days.indexOf(cc.day) /
                      13.3,
                  child: Container(
                    height: constraint.maxHeight * 0.05,
                    width: constraint.maxWidth * 1.8 / 6,
                    child: Center(
                        child: Text((cc.day != 'Ano' ? 'Ultimos ' : 'Ultimo ') +
                            cc.day +
                            (cc.day == 'Ano' ? '' : ' dias'))),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(cc.day == '7' ? 8 : 20),
                            right: Radius.circular(cc.day == 'Ano' ? 8 : 20))),
                  ),
                  duration: Duration(milliseconds: 200)),
            )
          ],
        ),
      );
  margin(
          {double t = 0,
          double l,
          double r = 0,
          Widget child,
          BoxConstraints constraints}) =>
      Container(
          margin: EdgeInsets.only(
              right: (r / 100) * constraints.maxWidth ?? 0,
              left: l == null
                  ? constraints.maxWidth * 0.05
                  : constraints.maxWidth * (l / 100),
              top: constraints.maxHeight * (t / 100)),
          child: child);
}
