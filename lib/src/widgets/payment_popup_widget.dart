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
                builder: (context, constraint) => Row(
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
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(20))),
                                child: Center(
                                  child: Text('Fixa'),
                                ),
                              ),
                              Container(
                                height: constraint.maxHeight * 0.5,
                                width: constraint.maxWidth * 0.3,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(20))),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(child: Text('Nova despesa')),
                                  InkWell(
                                    child: Icon(Icons.close),
                                  )
                                ],
                              ),
                              Row(
                                children: [Column()],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
          ),
          duration: Duration(seconds: 1)),
    );
  }
}
