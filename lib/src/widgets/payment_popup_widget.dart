import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/widgets/wavebutton_widget.dart';

class PaymentPopUpWidget extends StatefulWidget {
  final BoxConstraints constraints;
  PaymentPopUpWidget({this.constraints});

  @override
  _PaymentPopUpWidgetState createState() => _PaymentPopUpWidgetState();
}

class _PaymentPopUpWidgetState extends State<PaymentPopUpWidget>
    with TickerProviderStateMixin {
  final c = GetIt.I.get<CardsController>();

  final p = GetIt.I.get<PaymentController>();

  TextStyle titleStyle;

  final Color colorGreen = Color(0xff00D39A);
  List<String> titles = ['Cartão', 'Nova Despesa', 'Categoria', 'Testando'];
  double percent = 0;
  Animation<double> animation;
  /* Animation animationLeft; */
  double v = 0;
  AnimationController controller;
  /* 
  AnimationController controllerLeft; */
  @override
  void initState() {
    super.initState();
    /* controllerLeft =
        AnimationController(duration: Duration(milliseconds: 400), vsync: this);

    animationLeft = IntTween(begin: 3, end: 0).animate(controllerLeft)
      ..addListener(() => setState(() {})); */

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    animation = Tween<double>(begin: 2, end: 100).animate(controller)
      ..addListener(() {
        setState(() {
          print(v);
          v = p.percent / animation.value;
        });
      });
  }

  start() {
    /* controllerLeft.forward(); */
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    titleStyle = Theme.of(context).textTheme.headline3;
    return Observer(
      builder: (_) => AnimatedPositioned(
          bottom: widget.constraints.maxHeight * 0.2,
          left: p.payment == null
              ? widget.constraints.maxWidth
              : widget.constraints.maxWidth * 0.05,
          child: Container(
            height: widget.constraints.maxHeight * 0.25,
            width: widget.constraints.maxWidth * 0.95,
            decoration: BoxDecoration(
                color: c.card.color,
                borderRadius:
                    BorderRadius.horizontal(left: Radius.circular(20))),
            child: LayoutBuilder(
                builder: (context, constraint) => steps(
                    constraint) /* Observer(
                      builder: (_) => p.step == 0
                          ? step0(context, constraint)
                          : p.step == 1
                              ? step1(context, constraint)
                              : step2(context, constraint),
                    ) */
                ),
          ),
          duration: Duration(milliseconds: 100)),
    );
  }

  step0() => Column();
  steps(BoxConstraints constraint) => Observer(
        builder: (_) => Row(
          children: [
            step1Left(constraint),
            Observer(
              builder: (_) => AnimatedContainer(
                width: p.step == 1
                    ? constraint.maxWidth * 0.7
                    : constraint.maxWidth,
                height: constraint.maxHeight,
                duration: Duration(milliseconds: 400),
                child: Column(
                  children: [
                    title(context),
                    Expanded(
                      /* flex: animationLeft.value + 3, */
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Observer(
                              builder: (_) => p.step == 0
                                  ? step0()
                                  : p.step == 1
                                      ? step1()
                                      : step2(constraint)),
                          buttonNext(context, constraint)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  step1Left(BoxConstraints constraint) => AnimatedOpacity(
        duration: Duration(milliseconds: p.step == 1 ? 400 : 100),
        opacity: p.step == 1 ? 1.0 : 0.0,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 400),
          width: p.step == 1 ? constraint.maxWidth * 0.3 : 0.0,
          child: Column(
            children: [
              InkWell(
                onTap: () => p.changeStep(2),
                child: Container(
                  height: constraint.maxHeight * 0.5,
                  width: constraint.maxWidth * 0.3,
                  decoration: BoxDecoration(
                      color: colorGreen,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  child: Center(
                    child: Text('Fixa', style: titleStyle),
                  ),
                ),
              ),
              Container(
                height: constraint.maxHeight * 0.5,
                width: constraint.maxWidth * 0.3,
                decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                child: Center(
                  child: Text('Eventual', style: titleStyle),
                ),
              ),
            ],
          ),
        ),
      );
  step1() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: p.typesCard
            .map<Widget>((e) => Observer(
                builder: (_) => buttonSelect(
                    f: () => p.payment.changeTypePayment(e),
                    title: e.name,
                    constraint: widget.constraints,
                    selected: p.payment.type != null &&
                        p.payment.type.name == e.name)))
            .toList(),
      );
  /* step1(BuildContext context, BoxConstraints constraint) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: constraint.maxWidth * 0.3,
            child: Column(
              children: [
                Container(
                  height: constraint.maxHeight * 0.5,
                  width: constraint.maxWidth * 0.3,
                  decoration: BoxDecoration(
                      color: colorGreen,
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  child: Center(
                    child: Text('Fixa', style: titleStyle),
                  ),
                ),
                Container(
                  height: constraint.maxHeight * 0.5,
                  width: constraint.maxWidth * 0.3,
                  decoration: BoxDecoration(
                      color: Colors.grey[400],
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(20))),
                  child: Center(
                    child: Text('Eventual', style: titleStyle),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                /* title('Nova despesa', () => p.cancelPayment(context)), */
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(widget.constraints.maxWidth * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: p.typesCard
                              .map<Widget>((e) => Observer(
                                  builder: (_) => buttonSelect(
                                      f: () => p.payment.changeTypePayment(e),
                                      title: e.name,
                                      constraint: widget.constraints,
                                      selected: p.payment.type != null &&
                                          p.payment.type.name == e.name)))
                              .toList(),
                        ),
                        buttonNext(context, constraint)
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ); */
  step2(BoxConstraints constraint) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: ['Alimentação', 'Compras', 'Churrasco', 'Limpeza']
            .map<Widget>((e) => buttonSelect(
                constraint: constraint,
                f: () => null,
                selected: false,
                title: e))
            .toList(),
      );
  /* step2(BuildContext context, BoxConstraints constraint) => Column(children: [
        /* title('Categoria', () => p.cancelPayment(context)), */
        Expanded(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['Alimentação', 'Compras', 'Churrasco', 'Limpeza']
                  .map<Widget>((e) => buttonSelect(
                      constraint: constraint,
                      f: () => null,
                      selected: false,
                      title: e))
                  .toList(),
            ),
            buttonNext(context, constraint)
          ]),
        )
      ]); */

  title(BuildContext context) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(widget.constraints.maxWidth * 0.02),
                    child: Observer(
                        builder: (_) =>
                            Text(titles[p.step ?? 0], style: titleStyle))),
              ],
            ),
          ),
          InkWell(
              onTap: () {
                v = 0;
                p.cancelPayment(context);
              },
              child: Icon(Icons.close, color: Colors.white)),
        ],
      );

  buttonSelect(
          {String title,
          Function f,
          BoxConstraints constraint,
          bool selected = false}) =>
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
              style: titleStyle.copyWith(fontWeight: FontWeight.bold)),
        ),
      );

  buttonNext(BuildContext context, BoxConstraints constraint) => Container(
      height: constraint.maxWidth * 0.2,
      width: constraint.maxWidth * 0.2,
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(100)),
      child: Stack(
        children: [
          Positioned.fill(
            child: SizedBox(
              child: ClipPath(
                clipper: CircleClipper(),
                child: CustomPaint(
                    size: Size(
                        constraint.maxWidth * 0.15, constraint.maxWidth * 0.15),
                    painter: WaveButton(percent: v, color: colorGreen)),
              ),
            ),
          ),
          Positioned.fill(
            child: IconButton(
              onPressed: () {
                p.nextStep();
                start();
              },
              icon:
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: 40),
            ),
          ),
        ],
      ));
}
