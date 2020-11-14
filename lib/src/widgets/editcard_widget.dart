import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
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
  bool showTxtEditingNumber = false;
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
  TextEditingController limit = MoneyMaskedTextController(precision: 2);

  TextEditingController name = TextEditingController();

  TextEditingController number = MaskedTextController(
      mask: '#### #### #### ####',
      translator: {"#": RegExp(r'[0-9]')},
      text: '0000 0000 0000 0000');
  Duration duration = Duration(milliseconds: 200);
  dismissKeyboard(BuildContext context) {
    if (FocusScope.of(context).hasFocus) {
      FocusScope.of(context).unfocus();
    }
  }

  TextStyle titleStyle;
  @override
  Widget build(BuildContext context) {
    titleStyle = TextStyle(
        color: Theme.of(context).primaryColor.withOpacity(0.8),
        fontWeight: FontWeight.w700,
        fontSize: 16);
    name.text = cc.editCard.name;

    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraint) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
                child: margin(
                    child: Text('Informações'), constraint: constraint, t: 3)),
            Expanded(
                flex: 5,
                child: Container(
                  child: ListView(
                    controller: cc.scrollEditCard,
                    children: [
                      margin(
                          constraint: constraint,
                          l: 5,
                          t: 5,
                          child: SizedBox(
                              height: constraint.maxHeight * 0.1,
                              child: Row(children: [
                                AnimatedContainer(
                                    duration: duration,
                                    width: editColor
                                        ? 0
                                        : constraint.maxWidth * 0.65,
                                    height: constraint.maxHeight * 0.1,
                                    child: Stack(children: [
                                      AnimatedPositioned(
                                          left: showTxtEditingName
                                              ? -constraint.maxWidth
                                              : 0,
                                          child: SizedBox(
                                              height:
                                                  constraint.maxHeight * 0.1,
                                              width: constraint.maxWidth * 0.6,
                                              child: InkWell(
                                                onTap: () => setState(() =>
                                                    showTxtEditingName =
                                                        !showTxtEditingName),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      margin(
                                                        l: 4,
                                                        constraint: constraint,
                                                        child: Text(
                                                          'Nome',
                                                          style: titleStyle,
                                                        ),
                                                      ),
                                                      Observer(
                                                          builder: (_) => cc
                                                                      .editCard
                                                                      .name
                                                                      .length >
                                                                  0
                                                              ? Text(cc.editCard
                                                                  .name)
                                                              : Text(
                                                                  'Necessario',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red)))
                                                    ]),
                                              )),
                                          duration:
                                              Duration(milliseconds: 200)),
                                      AnimatedPositioned(
                                          right: showTxtEditingName
                                              ? null
                                              : -constraint.maxWidth,
                                          /*    left: showTxtEditingLimit ? 0 : null, */
                                          duration: duration,
                                          child: SizedBox(
                                              height:
                                                  constraint.maxHeight * 0.1,
                                              width: constraint.maxWidth * 0.6,
                                              child: Container(
                                                margin: EdgeInsets.only(top: 5),
                                                child: textField(
                                                    controller: name,
                                                    onChanged: (v) => cc
                                                        .editCard
                                                        .changeName(v),
                                                    suffix: IconButton(
                                                      icon: Icon(Icons.save),
                                                      onPressed: () => name
                                                                  .text.length >
                                                              0
                                                          ? setState(() {
                                                              showTxtEditingName =
                                                                  !showTxtEditingName;
                                                              dismissKeyboard(
                                                                  context);
                                                            })
                                                          : flushBar(
                                                                  color: Colors
                                                                      .red,
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
                                        : constraint.maxWidth * 0.25,
                                    height: constraint.maxHeight * 0.1,
                                    child: Card(
                                      child: Container(
                                        margin: EdgeInsets.all(5),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              actualColor(),
                                              InkWell(
                                                  onTap: () => setState(() =>
                                                      editColor = !editColor),
                                                  // onTap: () => SelectColor().showDialogColor(
                                                  //     context,
                                                  //     (v) => cc.editCard.changeColor(v)),
                                                  child: Observer(
                                                    builder: (_) =>
                                                        CircleAvatar(
                                                            backgroundColor: cc
                                                                .editCard
                                                                .color),
                                                  ))
                                            ]),
                                      ),
                                    ))
                              ]))),
                      margin(
                          l: 5,
                          r: 5,
                          child: selectColor(constraint),
                          constraint: constraint),
                      margin(
                          child: numberCard(constraint),
                          constraint: constraint,
                          /* t: 1, */
                          r: 5,
                          l: 5),
                      margin(
                          l: 5,
                          r: 5,
                          /* 
                          t: 1, */
                          child: limitCredit(constraint),
                          constraint: constraint),
                      margin(
                          child: Observer(
                              builder: (_) => SwitchListTile(
                                    title: Text('Debito', style: titleStyle),
                                    activeColor: Theme.of(context).primaryColor,
                                    value: cc.editCard.debit,
                                    onChanged: cc.editCard.changeDebit,
                                  )),
                          /* ListTile(
                            title: Text('Debito'),trailing: SwitchListTile(value: null, onChanged: null),
                          ), */
                          constraint: constraint,
                          l: 5,
                          r: 5,
                          t: 1),
                      margin(
                          child: Observer(
                            builder: (_) => SwitchListTile(
                                activeColor: Theme.of(context).primaryColor,
                                title: Text(
                                  'Credito',
                                  style: titleStyle,
                                ),
                                value: cc.editCard.credit,
                                onChanged: cc.editCard.changeCredit),
                          ),
                          constraint: constraint,
                          l: 5,
                          r: 5,
                          t: 1)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  numberCard(BoxConstraints constraint) => Container(
      height: constraint.maxHeight * 0.1,
      width: constraint.maxWidth * 0.7,
      child: LayoutBuilder(
        builder: (context, constraints) => Stack(
          children: [
            AnimatedPositioned(
              child: SizedBox(
                width: constraints.maxWidth,
                height: constraint.maxHeight * 0.1,
                child: margin(
                  l: 4,
                  r: 4,
                  constraint: constraint,
                  child: InkWell(
                    onTap: () => setState(() {
                      showTxtEditingNumber = !showTxtEditingNumber;
                      number.text = cc.editCard.numbers;
                    }),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Número',
                          style: titleStyle,
                        ),
                        Text((cc.editCard.numbers))
                      ],
                    ),
                  ),
                ),
              ),
              /* ListTile(
                      onTap: () => setState(
                          () => showTxtEditingNumber = !showTxtEditingNumber),
                      title: Text('Número'),
                      trailing: Text((cc.editCard.limit.toStringAsFixed(2))))), */
              duration: duration,
              left: showTxtEditingNumber ? -constraint.maxWidth : 0,
            ),
            AnimatedPositioned(
              child: Container(
                  margin: EdgeInsets.only(top: 5),
                  height: constraints.maxHeight - 5,
                  width: constraints.maxWidth,
                  child: textField(
                      type: TextInputType.numberWithOptions(),
                      label: 'Número',
                      controller: number,
                      suffix: IconButton(
                          icon: Icon(Icons.save),
                          onPressed: () => number.text.length > 0
                              ? setState(() {
                                  cc.editCard.changeNumber(
                                      number.text.replaceAll(' ', ''));
                                  showTxtEditingNumber = false;
                                })
                              : flushBar(
                                      color: Colors.red,
                                      title: 'Campo necessário',
                                      message:
                                          'Necessário colocar limite no cartão')
                                  .show(context)))),
              duration: duration,
              right: showTxtEditingNumber ? 0 : -constraint.maxWidth,
            ),
          ],
        ),
      ));
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
      height: constraint.maxHeight * 0.1,
      width: constraint.maxWidth * 0.7,
      child: LayoutBuilder(
          builder: (context, constraints) => Stack(children: [
                AnimatedPositioned(
                  duration: duration,
                  left: showTxtEditingLimit ? -constraint.maxWidth : 0,
                  child: SizedBox(
                    width: constraints.maxWidth,
                    height: constraint.maxHeight * 0.1,
                    child: margin(
                      l: 4,
                      r: 4,
                      constraint: constraint,
                      child: InkWell(
                        onTap: () => setState(
                            () => showTxtEditingLimit = !showTxtEditingLimit),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Limite',
                              style: titleStyle,
                            ),
                            Text('R\$' + (cc.editCard.limit.toStringAsFixed(2)))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
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
                                        cc.editCard.changeLimit(double.parse(
                                            limit.text
                                                .replaceAll('.', '')
                                                .replaceAll(',', '.')));
                                        showTxtEditingLimit = false;
                                        print(cc.editCard.limit);
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
          TextInputType type,
          Function onChanged}) =>
      Container(
        child: TextField(
          keyboardType: type,
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
}
