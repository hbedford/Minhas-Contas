import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/models/card_model.dart';

class CardWidget extends StatelessWidget {
  final CardModel card;
  final Function f;
  final String title;
  final bool editing;
  final bool bottomSheet;
  CardWidget(
      {this.card,
      this.f,
      this.title = '',
      this.editing = false,
      this.bottomSheet = false});
  final c = GetIt.I.get<CardsController>();
  TextEditingController remove = TextEditingController();
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => Observer(
          builder: (context) => Container(
            height: constraints.maxHeight * 0.3,
            width: constraints.maxWidth * 0.8,
            padding: EdgeInsets.symmetric(
                vertical: constraints.maxHeight * 0.05,
                horizontal: constraints.maxWidth * 0.05),
            margin: EdgeInsets.symmetric(
                horizontal: constraints.maxWidth * 0.01,
                vertical: constraints.maxHeight * 0.07),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: bottomSheet ? Colors.grey : card.color),
            child: card.name == null
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
                                  builder: (_) => Text(
                                      card.name.isEmpty ? 'Nome' : card.name,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline2
                                          .copyWith(fontSize: 32))),
                              Row(
                                children: [
                                  IconButton(
                                      color: Colors.white,
                                      icon: editing
                                          ? Icon(Icons.save)
                                          : Icon(Icons.settings),
                                      onPressed: editing
                                          ? () => c.saveCard(context)
                                          : f /* c.changeCard(card) */),
                                  Visibility(
                                    visible: editing && card.id == null,
                                    child: IconButton(
                                        color: Colors.white,
                                        icon: Icon(Icons.close),
                                        onPressed: c.cancelCard
                                        /* c.changeCard(card) */),
                                  ),
                                  Visibility(
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
                                      ))
                                ],
                              )
                            ]),
                        Observer(
                          builder: (_) => !editing && card.removeOption
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
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Observer(
                                            builder: (_) => Visibility(
                                              visible: card.debit,
                                              child: Text(
                                                'Debito',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3,
                                              ),
                                            ),
                                          ),
                                          Observer(
                                            builder: (_) => Visibility(
                                              visible: card.credit,
                                              child: Text(
                                                'Credito',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline3,
                                              ),
                                            ),
                                          )
                                        ]),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Limite:',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Text(
                                            'R\$ ${card.limit.toStringAsFixed(2)}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline3,
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
                                color: card.show ? null : Colors.white,
                                child: Text(
                                  card.number01,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Container(
                                color: card.show ? null : Colors.white,
                                child: Text(
                                  card.number02,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Container(
                                color: card.show ? null : Colors.white,
                                child: Text(
                                  card.number03,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => Container(
                                color: card.show ? null : Colors.white,
                                child: Text(
                                  card.number04,
                                  style: Theme.of(context).textTheme.headline3,
                                ),
                              ),
                            ),
                            Observer(
                              builder: (_) => IconButton(
                                  color: Colors.white,
                                  icon: Icon(card.show
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () => card.changeShow(!card.show)),
                            )
                          ],
                        ),
                      ]),
          ),
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
