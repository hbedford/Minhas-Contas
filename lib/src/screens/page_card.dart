import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/card_controller.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';

class PageCard extends StatelessWidget {
  final BoxConstraints constraint;
  PageCard({this.constraint});
  final c = GetIt.I.get<CardsController>();
  final cc = GetIt.I.get<CardController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: constraint.maxHeight * 0.08,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: null),
              Text('Cartões'),
              IconButton(icon: Icon(Icons.arrow_forward_ios), onPressed: null),
            ],
          ),
        ),
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
            constraint: constraint),
        margin(
            constraint: constraint,
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
                        constraint: constraint),
                    barDays(constraint, context),
                  ],
                ))),
      ],
    );
  }

  cardBasicInfo(BoxConstraints constraints, BuildContext context) => Container(
      height: constraints.maxHeight * 0.3,
      width: constraints.maxWidth * 0.8,
      padding: EdgeInsets.symmetric(
          vertical: constraints.maxHeight * 0.05,
          horizontal: constraints.maxWidth * 0.05),
      /* margin: EdgeInsets.symmetric(
          horizontal: constraints.maxWidth * 0.01,
          vertical: constraints.maxHeight * 0.07), */
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
                      icon:
                          /* editing
                                          ? Icon(Icons.save)
                                          :  */
                          Icon(Icons.settings),
                      onPressed: () =>
                          null /* editing
                                          ? () => c.saveCard(context)
                                          :  f*/ /* c.changeCard(card) */),
                  /*  Visibility(
                                    visible: editing && card.id == null,
                                    child: IconButton(
                                        color: Colors.white,
                                        icon: Icon(Icons.close),
                                        onPressed: c.cancelCard
                                        /* c.changeCard(card) */),
                                  ), */
                  /*  Visibility(
                                      visible: editing && c.editCard.id != null,
                                      child: IconButton(
                                        color: Colors.white,
                                        icon: Icon(Icons.close),
                                        onPressed: () => c.changeEditCard(null),
                                      )),
                                  Visibility(
                                      visible: !editing,
                                      child: IconButton(
                                        color: Colors.red[800],
                                        icon: Icon(Icons.close),
                                        onPressed: () => card.changeCheckRemove(
                                            !card.removeOption),
                                      )) */
                  IconButton(
                      icon: Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                      onPressed: null)
                ],
              )
            ]),
            Observer(
              builder: (_) =>
                  /* !editing && card.removeOption
                              ? Row(children: [
                                  Expanded(
                                    flex: 2,
                                    child: TextField(
                                      controller: remove,
                                      decoration: InputDecoration(
                                          hintText: 'Digite o nome do cartão',
                                          hintStyle: TextStyle(
                                            color: Colors.red,
                                            fontSize: 14,
                                          )),
                                    ),
                                  ),
                                  Spacer(),
                                  Flexible(
                                      child: InkWell(
                                    onTap: null,
                                    child: Text(
                                      'Remover',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                  ))
                                ])
                              : */
                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Limite:',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        child: Text(
                          'R\$ ${c.card.limit.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.headline3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: cc.days
                    .map((e) => InkWell(
                          onTap: () => cc.changeDay(e),
                          child: Container(
                            height: constraint.maxHeight * 0.05,
                            width: constraint.maxWidth * 0.89 / 5,
                            child: Center(
                              child: Text(
                                e,
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ),
            )),
            Observer(
              builder: (_) => AnimatedPositioned(
                  left: (constraint.maxWidth / 5) * cc.days.indexOf(cc.day),
                  child: Container(
                    height: constraint.maxHeight * 0.05,
                    width: constraint.maxWidth * 0.89 / 5,
                    child: Center(child: Text(cc.day + ' dias')),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(cc.day == '7' ? 8 : 20),
                            right: Radius.circular(cc.day == '90' ? 8 : 20))),
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
