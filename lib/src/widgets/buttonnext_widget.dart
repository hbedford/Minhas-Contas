import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/payment_controller.dart';
import 'package:minhasconta/src/widgets/wavebutton_widget.dart';

class ButtonNextWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final Color color;
  ButtonNextWidget({this.constraint, this.color});
  final p = GetIt.I.get<PaymentController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                      child: Observer(
                        builder: (_) => CustomPaint(
                            size: Size(constraint.maxWidth * 0.15,
                                constraint.maxWidth * 0.15),
                            painter:
                                WaveButton(percent: p.percent, color: color)),
                      ))),
            ),
            Positioned.fill(
              child: IconButton(
                onPressed: () {
                  /* start(); */
                  p.nextStep();

                  /* for (double i = 0; i < 100; i++) {
                    p.changePercent((10) + (i / 10));
                    print(p.percent);
                  } */
                },
                icon: Icon(Icons.arrow_forward_ios,
                    color: Colors.white, size: 40),
              ),
            ),
          ],
        ));
  }
}
