import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/models/category_model.dart';
import 'package:minhasconta/src/utils/dateandtime.dart';

import 'buttonnext_widget.dart';

class PaymentPopUpWidget extends StatefulWidget {
  final BoxConstraints constraints;
  final BuildContext context;
  PaymentPopUpWidget({this.constraints, this.context});

  @override
  _PaymentPopUpWidgetState createState() => _PaymentPopUpWidgetState();
}

class _PaymentPopUpWidgetState extends State<PaymentPopUpWidget>
    with TickerProviderStateMixin {
  final c = GetIt.I.get<CardsController>();

  final p = GetIt.I.get<PaymentController>();

  TextStyle titleStyle;

  final Color colorGreen = Color(0xff00D39A);
  List<String> titles = [
    'Cartão',
    'Nova Despesa',
    'Categoria',
    'Quando foi?',
    'Gastou com o que?'
  ];

  @override
  Widget build(BuildContext context) {
    titleStyle = Theme.of(context).textTheme.headline3;
    return Observer(
        builder: (_) => AnimatedPositioned(
            bottom: WidgetsBinding.instance.window.viewInsets.bottom > 0
                ? MediaQuery.of(context).viewInsets.bottom +
                    widget.constraints.maxHeight * 0.02
                : widget.constraints.maxHeight * 0.2,
            left: p.payment == null
                ? widget.constraints.maxWidth
                : widget.constraints.maxWidth * 0.05,
            child: Container(
                height: WidgetsBinding.instance.window.viewInsets.bottom > 0
                    ? widget.constraints.maxHeight * 0.4
                    : widget.constraints.maxHeight * 0.3,
                width: widget.constraints.maxWidth * 0.95,
                decoration: BoxDecoration(
                    color: c.card.color,
                    borderRadius:
                        BorderRadius.horizontal(left: Radius.circular(20))),
                child: LayoutBuilder(
                    builder: (ctxt, constraint) => steps(constraint, context))),
            duration: Duration(milliseconds: 100)));
  }

  step0() => Column();
  steps(BoxConstraints constraint, BuildContext context) => Observer(
      builder: (_) => Row(children: [
            step1Left(constraint),
            Observer(
                builder: (_) => AnimatedContainer(
                    width: p.step == 1
                        ? constraint.maxWidth * 0.7
                        : constraint.maxWidth,
                    height: constraint.maxHeight,
                    duration: Duration(milliseconds: 400),
                    child: Column(children: [
                      title(context),
                      Expanded(
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                            Observer(
                                builder: (_) => p.step == 0
                                    ? step0()
                                    : p.step == 1
                                        ? step1()
                                        : p.step == 2
                                            ? step2(constraint)
                                            : p.step == 3
                                                ? step3(context, constraint)
                                                : p.step == 4
                                                    ? step4(constraint)
                                                    : Container()),
                            Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ButtonNextWidget(
                                    constraint: constraint,
                                    color: colorGreen,
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(
                                          top: constraint.maxHeight * 0.03),
                                      child: Observer(
                                        builder: (_) => Text(
                                            p.step == 4
                                                ? 'Finalizar'
                                                : 'Próximo',
                                            style: TextStyle(
                                                color: Colors.white54,
                                                fontWeight: FontWeight.w700)),
                                      ))
                                ])
                          ]))
                    ])))
          ]));

  step1Left(BoxConstraints constraint) => AnimatedOpacity(
      duration: Duration(milliseconds: p.step == 1 ? 400 : 100),
      opacity: p.step == 1 ? 1.0 : 0.0,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: p.step == 1 ? constraint.maxWidth * 0.3 : 0.0,
          child: Column(children: [
            InkWell(
                onTap: () => p.changeStep(2),
                child: Container(
                    height: constraint.maxHeight * 0.5,
                    width: constraint.maxWidth * 0.3,
                    decoration: BoxDecoration(
                        color: colorGreen,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(20))),
                    child: Center(child: Text('Fixa', style: titleStyle)))),
            Container(
                height: constraint.maxHeight * 0.5,
                width: constraint.maxWidth * 0.3,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                child: Center(child: Text('Eventual', style: titleStyle)))
          ])));
  step1() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: p.typesCard
          .map<Widget>((e) => Observer(
              builder: (_) => buttonSelect(
                  f: () => p.payment.changeTypePayment(e),
                  title: e.name,
                  constraint: widget.constraints,
                  selected:
                      p.payment.type != null && p.payment.type.name == e.name)))
          .toList());

  step2(BoxConstraints constraint) => Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CategoryModel(color: Colors.red, name: 'Alimentação', id: 1),
        CategoryModel(color: Colors.red, name: 'Limpeza', id: 2),
        CategoryModel(color: Colors.red, name: 'Churrasco', id: 3)
      ]
          .map<Widget>((e) => buttonSelect(
              constraint: widget.constraints,
              f: () => p.payment.changeCategory(e),
              selected:
                  p.payment.category != null && p.payment.category.id == e.id,
              title: e.name))
          .toList());
  step3(BuildContext context, BoxConstraints constraint) =>
      Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Column(children: [
          Observer(
            builder: (_) => buttonSelectOverSize(
                constraint: constraint,
                selected: true,
                f: () async {
                  if (Platform.isIOS) {
                    showDialog(
                        context: widget.context,
                        builder: (context) => DateOrTimePicker().datePickerIOS(
                            constraint: widget.constraints,
                            context: widget.context,
                            first: DateTime.now().subtract(Duration(days: 30)),
                            last: DateTime.now(),
                            color: c.card != null ? c.card.color : null,
                            initial: p.payment.date,
                            f: p.payment.changeDate));
                  } else {
                    DateTime d = await DateOrTimePicker().datePicker(
                        theme: ThemeData(
                          secondaryHeaderColor: Colors.red,
                          colorScheme: Theme.of(context).colorScheme.copyWith(
                                secondary: Colors.white,
                                primary: c.card.color,
                                onSurface: c.card.color.withOpacity(1.0),
                                onPrimary: Colors.white,
                              ),
                          dialogBackgroundColor: Colors.white,
                        ),
                        context: context,
                        first: DateTime.now().subtract(Duration(days: 90)),
                        initial: p.payment.date ?? DateTime.now(),
                        last: DateTime.now());
                    if (d != null) p.payment.changeDate(d);
                  }
                },
                title: p.payment != null
                    ? p.payment.dateBr.replaceAll('-', '/') ?? 'DD/MM/AAAA'
                    : 'DD/MM/AAAA'),
          ),
          Text('Toque para definir a data',
              style: TextStyle(color: Colors.white54, fontSize: 12))
        ]),
        Column(children: [
          Observer(
            builder: (_) => buttonSelectOverSize(
                constraint: constraint,
                selected: true,
                f: () {
                  if (Platform.isIOS) {
                    DateOrTimePicker().timePickerIOS(
                        color: c.card != null ? c.card.color : null,
                        context: widget.context,
                        f: p.payment.changeTimeIOS,
                        initial: p.payment.timeIOS,
                        constraint: widget.constraints);
                  } else
                    DateOrTimePicker().timePicker(
                        theme: ThemeData(
                            colorScheme: Theme.of(context)
                                .colorScheme
                                .copyWith(primary: Colors.white),
                            timePickerTheme: TimePickerThemeData(
                                backgroundColor: c.card.color,
                                hourMinuteColor: c.card.color.withOpacity(0.8),
                                hourMinuteTextColor: Colors.white,
                                dialHandColor: c.card.color,
                                entryModeIconColor: Colors.white,
                                helpTextStyle: TextStyle(color: Colors.white),
                                dialTextColor: Colors.white)),
                        context: context,
                        initial: Duration(
                            hours: p.payment.time.hour ?? TimeOfDay.now().hour,
                            minutes: p.payment.time.minute ??
                                TimeOfDay.now().minute));
                },
                title: 'Horas: ' +
                    (p.payment != null
                        ? p.payment.timeToString ?? '12:00'
                        : '12:00')),
          ),
          Text('Toque para definir a data',
              style: TextStyle(color: Colors.white54, fontSize: 12))
        ])
      ]);
  step4(BoxConstraints constraint) => Column(children: [
        textField(
            controller: p.payment.nameEdit,
            hint: 'Nome do produto',
            width: constraint.maxWidth * 0.6,
            height: constraint.maxWidth * 0.1),
        Flexible(
          flex: 2,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: constraint.maxHeight * 0.1,
                margin: EdgeInsets.only(right: constraint.maxWidth * 0.02),
                child: Text(
                  'R\$',
                  style: titleStyle.copyWith(fontSize: 24),
                ),
              ),
              textField(
                  type: TextInputType.number,
                  controller: p.payment.valueEdit,
                  hint: 'Valor',
                  width: constraint.maxWidth * 0.4,
                  height: constraint.maxWidth * 0.08)
            ],
          ),
        ),
        Row(
          children: [
            Text(
              'Quantos?',
              style: titleStyle.copyWith(fontSize: 20),
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                onPressed: () => p.payment.changeAmount(p.payment.amount - 1)),
            Text(
              p.payment.amount.toString(),
              style: titleStyle.copyWith(fontSize: 20),
            ),
            IconButton(
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
                onPressed: () => p.payment.changeAmount(p.payment.amount + 1)),
          ],
        )
      ]);
  title(BuildContext context) => Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  margin: EdgeInsets.all(widget.constraints.maxWidth * 0.02),
                  child: Observer(
                      builder: (_) =>
                          Text(titles[p.step ?? 0], style: titleStyle)))
            ])),
            InkWell(
                onTap: () => p.cancelPayment(context),
                child: Icon(Icons.close, color: Colors.white))
          ]);

  buttonSelect({
    String title,
    Function f,
    BoxConstraints constraint,
    bool selected = false,
  }) =>
      InkWell(
          onTap: f,
          child: AnimatedContainer(
              duration: Duration(milliseconds: 200),
              margin: EdgeInsets.only(
                  bottom: constraint.maxHeight * 0.01,
                  left: selected ? constraint.maxWidth * 0.05 : 0.0),
              padding: EdgeInsets.symmetric(
                  vertical: constraint.maxHeight * 0.005,
                  horizontal: constraint.maxWidth * 0.02),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: selected ? Colors.white24 : null),
              child: Text(title,
                  style: titleStyle.copyWith(fontWeight: FontWeight.bold))));
  buttonSelectOverSize(
          {String title,
          Function f,
          BoxConstraints constraint,
          bool selected = false}) =>
      InkWell(
          onTap: f,
          child: Container(
              margin: EdgeInsets.only(bottom: constraint.maxWidth * 0.02),
              decoration: BoxDecoration(
                  color: selected ? Colors.white24 : null,
                  borderRadius: BorderRadius.circular(100)),
              padding: EdgeInsets.symmetric(
                  vertical: constraint.maxWidth * 0.02,
                  horizontal: constraint.maxWidth * 0.04),
              child: Text(title,
                  style: titleStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 18))));
  textField(
          {TextEditingController controller,
          TextInputType type,
          double width,
          double height,
          String hint}) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: height * 0.2),
        padding: EdgeInsets.only(left: width * 0.05),
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: Colors.white54, borderRadius: BorderRadius.circular(20)),
        child: Center(
          child: TextField(
              keyboardType: type,
              controller: controller,
              style: titleStyle.copyWith(
                  fontStyle: FontStyle.italic, fontWeight: FontWeight.w700),
              decoration: InputDecoration.collapsed(
                  hoverColor: Colors.white54,
                  fillColor: Colors.white54,
                  hintText: hint,
                  hintStyle: titleStyle.copyWith(
                      fontStyle: FontStyle.italic,
                      color: Colors.grey[400],
                      fontWeight: FontWeight.w700))),
        ),
      );
}
