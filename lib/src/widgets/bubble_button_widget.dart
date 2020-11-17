import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:vector_math/vector_math.dart' as vector;

class BubbleWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(size.width, y1, x2, y2)
    /*  final Rect beforeRect = Rect.fromLTWH(0, (size.height / 2) - 10, 10, 10);
    final Rect largeRect = Rect.fromLTWH(10, 0, size.width - 20, 70);
    final Rect afterRect =
        Rect.fromLTWH(size.width - 10, (size.height / 2) - 10, 10, 10);

    final path = Path();
    path.arcTo(beforeRect, vector.radians(0), vector.radians(90), false);
    path.lineTo(20, size.height / 2);
    path.arcTo(largeRect, vector.radians(0), -vector.radians(180), false);
    path.moveTo(size.width - 10, size.height / 2);
    path.lineTo(size.width - 10, (size.height / 2) - 10);
    path.arcTo(afterRect, vector.radians(180), vector.radians(-90), false);
    path.close(); */

    canvas.drawPath(path, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
