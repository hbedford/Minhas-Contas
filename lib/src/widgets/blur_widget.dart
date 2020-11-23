/* import 'package:flutter/material.dart';

class BlurWidget extends CustomPainter {
  double blurSigma;
  BlurWidget({@required this.blurSigma});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = new Paint()
      ..color = Colors.lightBlue
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
     /*  ..strokeWidth = circleWidth */
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, blurSigma);
    Offset center = new Offset(size.width / 2, size.height / 2);/* 
    double radius = min(size.width / 2, size.height / 2) */;
    canvas.drawRect(Rect.fromLTRB(0, 0, right, bottom),);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return null;
  }
}
 */
