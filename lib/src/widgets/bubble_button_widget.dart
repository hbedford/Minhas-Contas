import 'package:flutter/material.dart';
import 'dart:math' as Math;

import 'package:vector_math/vector_math.dart' as vector;

class BubbleWidget extends CustomPainter {
  final Color color;
  BubbleWidget({this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    path.moveTo(size.width, 0);
    path.quadraticBezierTo(
        size.width, size.height * 0.3, size.width * 0.7, size.height * 0.4);
    /*  path.lineTo(size.width * 0.7, size.height * 0.4); */
    /* 
path.arcTo(Rect.fromLTWH(0, 0, size.width, size.height - 20), -pi, pi, false); */
    path.lineTo(size.width * 0.7, size.height * 0.6);
    /* path.quadraticBezierTo(size.width * 0.0, size.height * 0.5,
        size.width * 0.7, size.height * 0.6); */
    path.quadraticBezierTo(
        size.width, size.height * 0.7, size.width, size.height);

    canvas.drawPath(path, Paint()..color = color);
    final path1 = Path();
    /* 
    path1.moveTo(size.width, size.height * 0.3); */
    /* 
    path1.lineTo(size.width, size.height * 0.4); */
    path1.arcTo(
        Rect.fromLTWH(
            10, size.height * 0.37, size.width, size.height * 0.5 / 2),
        vector.radians(40),
        vector.radians(280),
        true);
    /*  path.lineTo(size.width, size.height); */
    /*  path1.quadraticBezierTo(
        0, size.height * 0.5, size.width, size.height * 0.8); */
    canvas.drawPath(path1, Paint()..color = color);
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
