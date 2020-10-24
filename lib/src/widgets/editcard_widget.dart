import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';

import 'selectcolor_widget.dart';

class EditCardWidget extends StatefulWidget {
  @override
  _EditCardWidgetState createState() => _EditCardWidgetState();
}

class _EditCardWidgetState extends State<EditCardWidget> {
  final cc = GetIt.I.get<CardsController>();

  bool showTxtEditingLimit = false;
  bool showTxtEditingName = false;
  bool editColor = false;

  TextEditingController limit = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController number = TextEditingController();
  Duration duration = Duration(milliseconds: 200);
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              width: editColor ? 0 : null,
                              child: Container(
                                  width: constraint.maxWidth * 0.6,
                                  height: constraint.maxHeight * 0.13,
                                  child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        left: showTxtEditingName
                                            ? -constraint.maxWidth * 0.6
                                            : 0,
                                        child: SizedBox(
                                          width: constraint.maxWidth * 0.6,
                                          child: ListTile(
                                              onTap: () => setState(() =>
                                                  showTxtEditingName =
                                                      !showTxtEditingName),
                                              title: Text(
                                                'Nome',
                                              ),
                                              trailing: Observer(
                                                builder: (_) =>
                                                    cc.editCard.name.length > 0
                                                        ? Text(cc.editCard.name)
                                                        : Text(
                                                            'Necessario',
                                                            style: TextStyle(
                                                                color:
                                                                    Colors.red),
                                                          ),
                                              )),
                                        ),
                                        duration: duration,
                                      ),
                                      AnimatedPositioned(
                                        right: showTxtEditingName
                                            ? 0
                                            : -constraint.maxWidth * 0.6,
                                        duration: duration,
                                        child: Container(
                                          width: constraint.maxWidth * 0.6,
                                          child: TextField(
                                            controller: name,
                                            onChanged: (v) =>
                                                cc.editCard.changeName(v),
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(),
                                                labelText: 'Nome do cartão'),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              width: editColor
                                  ? constraint.maxWidth * 0.9
                                  : constraint.maxWidth * 0.2,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  AnimatedCrossFade(
                                    firstChild: Text('Cor:'),
                                    duration: Duration(milliseconds: 200),
                                    secondChild: Text('Cor atual ->'),
                                    reverseDuration:
                                        Duration(milliseconds: 200),
                                    crossFadeState: editColor
                                        ? CrossFadeState.showSecond
                                        : CrossFadeState.showFirst,
                                  ),
                                  InkWell(
                                    onTap: () =>
                                        setState(() => editColor = !editColor),
                                    // onTap: () => SelectColor().showDialogColor(
                                    //     context,
                                    //     (v) => cc.editCard.changeColor(v)),
                                    child: Observer(
                                      builder: (_) => CircleAvatar(
                                        backgroundColor: cc.editCard.color,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                        AnimatedContainer(
                            height: editColor ? constraint.maxHeight * 0.3 : 0,
                            duration: Duration(milliseconds: 200),
                            child: AnimatedOpacity(
                              duration: Duration(milliseconds: 100),
                              opacity: editColor ? 1 : 0,
                              child: LayoutBuilder(
                                builder: (context, constraint) => Column(
                                  children: [
                                    Text('Selecione uma cor'),
                                    SelectColorWidget(
                                      constraint: constraint,
                                      f: (v) => cc.editCard.changeColor(v),
                                    ),
                                  ],
                                ),
                              ),
                            )),
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
                                  duration: duration,
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
                                            (cc.editCard.limit
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
                                                        cc.editCard.changeLimit(
                                                            double.parse(
                                                                limit.text));
                                                        showTxtEditingLimit =
                                                            false;
                                                      });
                                                    }),
                                                /* prefixIcon: IconButton(
                                                    icon: Icon(Icons.arrow_back,
                                                        color: Colors.blue),
                                                    onPressed: () => setState(() =>
                                                        showTxtEditingLimit =
                                                            !showTxtEditingLimit)), */
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
  }

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
