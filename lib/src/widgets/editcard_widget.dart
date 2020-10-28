import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/widgets/flushbar_widget.dart';

class EditCardWidget extends StatefulWidget {
  @override
  _EditCardWidgetState createState() => _EditCardWidgetState();
}

class _EditCardWidgetState extends State<EditCardWidget> {
  final cc = GetIt.I.get<CardsController>();

  bool showTxtEditingLimit = false;
  bool showTxtEditingName = false;
  bool editColor = false;

  final List<Color> list = [
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.indigo,
    Colors.blue,
    Colors.cyan,
    Colors.teal,
    Colors.green,
    Colors.lime,
    Colors.yellow,
    Colors.amber,
    Colors.orange,
    Colors.brown,
    Colors.grey
  ];
  TextEditingController limit = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController number = TextEditingController();
  Duration duration = Duration(milliseconds: 200);
  dismissKeyboard(BuildContext context) => FocusScope.of(context).unfocus();
  @override
  Widget build(BuildContext context) {
    name.text = cc.editCard.name;
    double keyboard = WidgetsBinding.instance.window.viewInsets.bottom;

    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraint) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: margin(
                    child: Text('Informações'), constraint: constraint, t: 3)),
            Expanded(
                child: ListView(
              controller: cc.scrollEditCard,
              children: [
                margin(
                    constraint: constraint,
                    l: 3,
                    t: 5,
                    child: SizedBox(
                        height: constraint.maxHeight * 0.1,
                        child: Row(children: [
                          AnimatedContainer(
                              duration: duration,
                              width: editColor ? 0 : constraint.maxWidth * 0.7,
                              height: constraint.maxHeight * 0.15,
                              child: Stack(children: [
                                AnimatedPositioned(
                                    left: showTxtEditingName
                                        ? -constraint.maxWidth
                                        : 0,
                                    child: SizedBox(
                                      height: constraint.maxHeight * 0.1,
                                      width: constraint.maxWidth * 0.6,
                                      child: ListTile(
                                          onTap: () => setState(() =>
                                              showTxtEditingName =
                                                  !showTxtEditingName),
                                          title: Text('Nome'),
                                          trailing: Observer(
                                              builder: (_) => cc.editCard.name
                                                          .length >
                                                      0
                                                  ? Text(cc.editCard.name)
                                                  : Text('Necessario',
                                                      style: TextStyle(
                                                          color: Colors.red)))),
                                    ),
                                    duration: Duration(milliseconds: 200)),
                                AnimatedPositioned(
                                    right: showTxtEditingName
                                        ? null
                                        : -constraint.maxWidth,
                                    /*    left: showTxtEditingLimit ? 0 : null, */
                                    duration: duration,
                                    child: SizedBox(
                                        height: constraint.maxHeight * 0.1,
                                        width: constraint.maxWidth * 0.6,
                                        child: Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: textField(
                                              controller: name,
                                              onChanged: (v) =>
                                                  cc.editCard.changeName(v),
                                              suffix: IconButton(
                                                icon: Icon(Icons.save),
                                                onPressed: () => name.text.length >
                                                        0
                                                    ? setState(() {
                                                        showTxtEditingName =
                                                            !showTxtEditingName;
                                                        dismissKeyboard(
                                                            context);
                                                      })
                                                    : flushBar(
                                                            color: Colors.red,
                                                            title:
                                                                'Campo necessario',
                                                            message:
                                                                'É necessario preencher com algum nome')
                                                        .show(context),
                                              ),
                                              label: 'Nome do cartão'),
                                        )))
                              ])),
                          AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              width: editColor
                                  ? constraint.maxWidth * 0.9
                                  : constraint.maxWidth * 0.2,
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    actualColor(),
                                    InkWell(
                                        onTap: () => setState(
                                            () => editColor = !editColor),
                                        // onTap: () => SelectColor().showDialogColor(
                                        //     context,
                                        //     (v) => cc.editCard.changeColor(v)),
                                        child: Observer(
                                          builder: (_) => CircleAvatar(
                                              backgroundColor:
                                                  cc.editCard.color),
                                        ))
                                  ]))
                        ]))),
                margin(
                    l: 3,
                    r: 3,
                    t: 5,
                    child: limitCredit(constraint),
                    constraint: constraint),
              ],
            ))
          ],
        ),
      ),
    );
  }

  flex(Widget child) =>
      Flexible(child: LayoutBuilder(builder: (context, constraint) => child));
  actualColor() => AnimatedCrossFade(
        firstChild: Text('Cor:'),
        duration: Duration(milliseconds: 200),
        secondChild: Text('Cor atual ->'),
        reverseDuration: Duration(milliseconds: 200),
        crossFadeState:
            editColor ? CrossFadeState.showSecond : CrossFadeState.showFirst,
      );
  selectColor(BoxConstraints constraint) => AnimatedContainer(
      height: editColor ? constraint.maxHeight * 0.3 : 0,
      duration: Duration(milliseconds: 200),
      child: AnimatedOpacity(
          duration: Duration(milliseconds: 100),
          opacity: editColor ? 1 : 0,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Selecione uma cor'),
            Wrap(
                children: list
                    .map((e) => AnimatedOpacity(
                          duration: Duration(seconds: 1 * list.indexOf(e)),
                          opacity: editColor ? 1 : 0,
                          child: Container(
                            margin: EdgeInsets.all(constraint.maxHeight * 0.01),
                            child: InkWell(
                              child: CircleAvatar(
                                radius: constraint.maxHeight * 0.04,
                                backgroundColor: e,
                              ),
                              onTap: () => cc.editCard.changeColor(e),
                            ),
                          ),
                        ))
                    .toList())
          ])));

  limitCredit(BoxConstraints constraint) => Container(
      height: constraint.maxHeight * 0.15,
      width: constraint.maxWidth * 0.7,
      child: LayoutBuilder(
          builder: (context, constraints) => Stack(children: [
                AnimatedPositioned(
                    duration: duration,
                    left: showTxtEditingLimit ? -constraint.maxWidth : 0,
                    child: SizedBox(
                        width: constraints.maxWidth,
                        child: ListTile(
                            onTap: () => setState(() =>
                                showTxtEditingLimit = !showTxtEditingLimit),
                            title: Text('Limite'),
                            trailing: Text('R\$' +
                                (cc.editCard.limit.toStringAsFixed(2)))))),
                AnimatedPositioned(
                    duration: Duration(milliseconds: 200),
                    right: showTxtEditingLimit ? 0 : -constraint.maxWidth,
                    child: Container(
                        margin: EdgeInsets.only(top: 5),
                        height: constraints.maxHeight - 5,
                        width: constraints.maxWidth,
                        child: textField(
                            label: 'Limite',
                            controller: limit,
                            prefixText: 'R\$',
                            suffix: IconButton(
                                icon: Icon(Icons.save),
                                onPressed: () => limit.text.length > 0
                                    ? setState(() {
                                        cc.editCard.changeLimit(
                                            double.parse(limit.text));
                                        showTxtEditingLimit = false;
                                      })
                                    : flushBar(
                                            color: Colors.red,
                                            title: 'Campo necessario',
                                            message:
                                                'Necessario colocar 1 limite no cartão')
                                        .show(context)))))
              ])));
  margin(
          {double t = 0,
          double l,
          double r = 0,
          @required Widget child,
          @required BoxConstraints constraint}) =>
      Container(
        margin: EdgeInsets.only(
            right: (r / 100) * constraint.maxWidth ?? 0,
            left: l == null
                ? constraint.maxWidth * 0.05
                : constraint.maxWidth * (l / 100),
            top: constraint.maxHeight * (t / 100)),
        child: child,
      );
  textField(
          {TextEditingController controller,
          Widget prefix,
          Widget suffix,
          String label,
          String prefixText,
          Function onChanged}) =>
      Container(
        /*  padding: EdgeInsets.symmetric(vertical: 5), */
        child: TextField(
          onChanged: onChanged,
          controller: controller,
          decoration: InputDecoration(
              prefixText: prefixText,
              labelText: label,
              border: OutlineInputBorder(),
              prefixIcon: prefix,
              suffixIcon: suffix),
        ),
      );

  /* Expanded(
      child: LayoutBuilder(
          builder: (context, constraint) =>
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                /* margin(
                    t: 3,
                    child: Text('Informações',
                        style: Theme.of(context).textTheme.subtitle1),
                    constraint: constraint), */
                Expanded(
                  child: SingleChildScrollView(
                    controller: cc.scrollEditCard,
                    child: Column(children: [
                      Flexible(
                        child: Row(
                          children: [
                            AnimatedContainer(
                              color: Colors.blue,
                              duration: duration,
                              width: editColor ? 0 : constraint.maxWidth * 0.7,
                              height: constraint.maxHeight * 0.15,
                              child: Stack(
                                children: [
                                  AnimatedPositioned(
                                      left: showTxtEditingName
                                          ? -constraint.maxWidth * 0.8
                                          : 0,
                                      child: ListTile(
                                          onTap: () => setState(() =>
                                              showTxtEditingName =
                                                  !showTxtEditingName),
                                          title: Text('Nome'),
                                          trailing: Observer(
                                              builder: (_) => cc.editCard.name
                                                          .length >
                                                      0
                                                  ? Text(cc.editCard.name)
                                                  : Text('Necessario',
                                                      style: TextStyle(
                                                          color: Colors.red)))),
                                      duration: Duration(milliseconds: 200)),
                                  AnimatedPositioned(
                                      right: showTxtEditingName
                                          ? null
                                          : -constraint.maxWidth * 0.8,
                                      left: showTxtEditingLimit ? 0 : null,
                                      duration: duration,
                                      child: Container(
                                          width: constraint.maxWidth * 0.6,
                                          child:
                                              TextField()) /* textField(
                                        controller: name,
                                        onChanged: (v) =>
                                            cc.editCard.changeName(v),
                                        suffix: IconButton(
                                          icon: Icon(Icons.save),
                                          onPressed: () => setState(
                                              () => cc.saveCard(context)),
                                        ),
                                        label: 'Nome do cartão'), */
                                      ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(child: null)
                      /* Flexible(
                        /*  height: MediaQuery.of(context).viewInsets.bottom > 0
                            ? constraint.maxHeight * 0.2
                            : constraint.maxHeight * 0.13,
                        width: constraint.maxWidth, */
                        child: margin(
                          t: 3,
                          r: 5,
                          constraint: constraint,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AnimatedContainer(
                                  duration: Duration(milliseconds: 200),
                                  width:
                                      editColor ? 0 : constraint.maxWidth * 0.7,
                                  /*  height: constraint.maxHeight * 0.13, */
                                  child: Container(
                                      child: Stack(
                                    children: [
                                      AnimatedPositioned(
                                        left: showTxtEditingName
                                            ? -constraint.maxWidth * 0.8
                                            : 0,
                                        child: SizedBox(
                                          width: constraint.maxWidth * 0.6,
                                          /*  height:
                                                    constraint.maxHeight * 0.13, */
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
                                              ? null
                                              : -constraint.maxWidth * 0.8,
                                          left: showTxtEditingLimit ? 0 : null,
                                          duration: duration,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                        .viewInsets
                                                        .bottom >
                                                    0
                                                ? constraint.maxHeight * 0.15
                                                : constraint.maxHeight * 0.13,
                                            width: constraint.maxWidth * 0.6,
                                            child: textField(
                                                controller: name,
                                                onChanged: (v) =>
                                                    cc.editCard.changeName(v),
                                                suffix: IconButton(
                                                  icon: Icon(Icons.save),
                                                  onPressed: () => setState(
                                                      () => cc.saveCard(context)),
                                                ),
                                                label: 'Nome do cartão'),
                                          )),
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
                                          actualColor(),
                                          InkWell(
                                              onTap: () => setState(
                                                  () => editColor = !editColor),
                                              // onTap: () => SelectColor().showDialogColor(
                                              //     context,
                                              //     (v) => cc.editCard.changeColor(v)),
                                              child: Observer(
                                                builder: (_) => CircleAvatar(
                                                    backgroundColor:
                                                        cc.editCard.color),
                                              ))
                                        ]))
                              ]),
                        ),
                      ), */
                      /* selectColor(constraint), */
                      /*  Divider(), */
                      /* Row(children: [
                        Flexible(
                            child: textField(
                                controller: number, label: 'Número do cartão'))
                      ]), */
                      /* Divider(), */
                      /* limitCredit(constraint) */
                    ]),
                  ),
                )
              ]))); */
}
