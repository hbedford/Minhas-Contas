import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:vector_math/vector_math.dart' as vector;

class BubbleWidget extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(
        size.width, size.height * 0.3, size.width * 0.5, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.5,
        size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(
        size.width, size.height * 0.7, size.width, size.height);

    canvas.drawPath(path, Paint()..color = Colors.blue);

    /* final path = Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(
        size.width, size.height * 0.3, size.width * 0.5, size.height * 0.4);
    path.quadraticBezierTo(size.width * 0.1, size.height * 0.5,
        size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(
        size.width, size.height * 0.7, size.width, size.height);

    canvas.drawPath(path, Paint()..color = Colors.blue); */
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
