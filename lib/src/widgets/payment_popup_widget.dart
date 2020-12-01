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
    with SingleTickerProviderStateMixin {
  final c = GetIt.I.get<CardsController>();

  final p = GetIt.I.get<PaymentController>();

  TextStyle titleStyle;

  final Color colorGreen = Color(0xff00D39A);

  double percent = 0;
  Animation<double> animation;
  double v = 0;
  AnimationController controller;
  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    animation =
        Tween<double>(begin: percent, end: percent + 40).animate(controller)
          ..addListener(() {
            setState(() {
              v = animation.value;
            });
            percent = percent + 40;
          });
  }

  start() {
    controller.forward()
      ..whenComplete(() => animation =
          Tween<double>(begin: percent, end: percent + 40).animate(controller)
            ..addListener(() {
              setState(() {
                v = animation.value;
              });
              percent = percent + 40;
            }));
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
                builder: (context, constraint) => Observer(
                      builder: (_) => p.step == 0
                          ? step0(context, constraint)
                          : p.step == 1
                              ? step1(context, constraint)
                              : step2(context, constraint),
                    )),
          ),
          duration: Duration(milliseconds: 100)),
    );
  }

  step0(BuildContext context, BoxConstraints constraint) => Column(
        children: [],
      );

  step1(BuildContext context, BoxConstraints constraint) => Row(
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
                    child: Text(
                      'Fixa',
                      style: titleStyle,
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
                    child: Text(
                      'Eventual',
                      style: titleStyle,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                title(
                  'Nova despesa',
                  () => p.cancelPayment(context),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(widget.constraints.maxWidth * 0.02),
                    child: Row(
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
                                            p.payment.type.name == e.name),
                                  ))
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
      );

  step2(BuildContext context, BoxConstraints constraint) => Column(
        children: [title('Categoria', () => p.cancelPayment(context))],
      );

  title(String title, Function f) => Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(widget.constraints.maxWidth * 0.02),
                    child: Text(
                      title,
                      style: titleStyle,
                    )),
              ],
            ),
          ),
          InkWell(
            onTap: f,
            child: Icon(
              Icons.close,
              color: Colors.white,
            ),
          ),
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
              left: selected ? constraint.maxWidth * 0.02 : 0.0),
          padding: EdgeInsets.symmetric(
              vertical: constraint.maxHeight * 0.005,
              horizontal: constraint.maxWidth * 0.02),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: selected ? Colors.white24 : null),
          child: Text(
            title,
            style: titleStyle.copyWith(fontWeight: FontWeight.bold),
          ),
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
            /* left: -constraint.maxWidth * 0.2, */
            child: SizedBox(
              /* 
              height: constraint.maxWidth * 0.15,
              width: constraint.maxWidth * 0.15, */

              child: ClipPath(
                clipper: CircleClipper(),
                child: CustomPaint(
                  size: Size(
                      constraint.maxWidth * 0.15, constraint.maxWidth * 0.15),
                  painter: WaveButton(percent: v, color: colorGreen),
                  /*  child: SizedBox(
                      height: constraint.maxWidth * 0.15,
                      width: constraint.maxWidth * 0.15,
                    ), */
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: IconButton(
              onPressed: () => start(),
              icon: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
        ],
      ));
}
