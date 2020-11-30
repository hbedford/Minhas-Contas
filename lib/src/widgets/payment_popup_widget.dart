import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';

class PaymentPopUpWidget extends StatelessWidget {
  final BoxConstraints constraints;
  PaymentPopUpWidget({this.constraints});
  final c = GetIt.I.get<CardsController>();
  final p = GetIt.I.get<PaymentController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => AnimatedPositioned(
          bottom: constraints.maxHeight * 0.2,
          left: p.payment == null
              ? constraints.maxWidth
              : constraints.maxWidth * 0.05,
          child: Container(
            height: constraints.maxHeight * 0.25,
            width: constraints.maxWidth * 0.95,
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
                      color: Color(0xff00D39A),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(20))),
                  child: Center(
                    child: Text('Fixa'),
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
                    child: Text('Eventual'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.all(constraints.maxWidth * 0.02),
                        child: Text('Nova despesa')),
                    InkWell(
                      onTap: () => p.cancelPayment(context),
                      child: Icon(Icons.close),
                    )
                  ],
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(constraints.maxWidth * 0.02),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: p.typesCard
                              .map((e) => AnimatedContainer(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    duration: Duration(seconds: 1),
                                    margin: EdgeInsets.only(
                                        /* 
                                                      top: constraints
                                                              .maxHeight *
                                                          0.01, */
                                        bottom: constraints.maxHeight * 0.01,
                                        left: constraints.maxWidth * 0.02),
                                    child: InkWell(
                                        onTap: () => p.changeTypePayment(e),
                                        child: Text(e.name)),
                                  ))
                              .toList(),
                        )
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
        children: [],
      );
  title(String title, Function f) => Row(
        children: [
          Text(title),
          InkWell(
            onTap: f,
            child: Icon(Icons.close),
          ),
        ],
      );
}
