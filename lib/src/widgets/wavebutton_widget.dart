import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class WaveButton extends CustomPainter {
  final double percent;
  final double total;
  final Color color;
  WaveButton({this.percent, this.total, this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    print(percent);
    double w = size.width * (percent / 10);
    path.moveTo(w * 0.2, -size.height * 0.2);
    /* if (percent == 0) { */
    path.quadraticBezierTo(
        w * 0.3, size.height * 0.25, w * 0.2, size.height * 0.5);
    path.quadraticBezierTo(w * 0.1, size.height * 0.75, w * 0.3, size.height);
    /* } else {
      path.quadraticBezierTo(
          w * 0.2, size.height * 0.25, w * 0.4, size.height * 0.5);
      path.quadraticBezierTo(w * 0.6, size.height * 0.75, w * 0.3, size.height); */
    /* path.lineTo(size.width * 0.5, size.height);
    path.quadraticBezierTo(size.height * 0.3, w * 0.2, -size.height, w * 0.5);
    path.lineTo(0, size.width);*/
    /* } */

    path.lineTo(-w, size.height);
    path.lineTo(-w, 0);
    canvas.drawPath(path, Paint()..color = color);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    return Path()
      ..addOval(new Rect.fromCircle(
          center: new Offset(size.width / 2, size.height / 2),
          radius: size.width / 2));
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
