import 'package:flutter/material.dart';

class ProjectClipper extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    double w = size.width;
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        w * 0.2, size.height * 0.75, w * 0.5, size.height * 0.75);
    path.quadraticBezierTo(w * 0.85, size.height * 0.75, w, size.height * 0.55);
    path.lineTo(w, size.height);
    path.lineTo(w, 0);

    /* path.quadraticBezierTo(
        w * 0.15, size.height * 0.85, w * 25, size.height * 0.75); */
    /* path.quadraticBezierTo(
        w * 0.50, size.height * 0.50, w * 0.25, size.height * 0.25); */
    /* path.lineTo(w, 0); */

    /* path.moveTo(w * (0.2), -size.height * 0.2);

    path.quadraticBezierTo(
        w * 0.3, size.height * 0.25, w * 0.2, size.height * 0.5);
    path.quadraticBezierTo(w * 0.1, size.height * 0.75, w * 0.3, size.height);

    path.lineTo(-w, size.height);
    path.lineTo(-w, 0); */
    canvas.drawPath(path, Paint()..color = Colors.blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}