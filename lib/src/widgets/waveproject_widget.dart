import 'package:flutter/material.dart';

class ProjectClipper extends CustomClipper<Path> {
  final double wave;
  ProjectClipper({this.wave = 0.0});
  @override
  Path getClip(Size size) {
    double w = size.width;
    return Path()
      ..lineTo(0, size.height)
      ..quadraticBezierTo(
          w * 0.2,
          size.height *
              (wave == 0
                  ? 0.75
                  : 0.75 + wave > 1
                      ? 1
                      : 0.75 + wave),
          w * 0.5,
          size.height *
              (wave == 0
                  ? 0.75
                  : 0.75 + wave > 1
                      ? 1
                      : 0.75 + wave))
      ..quadraticBezierTo(
          w * 0.85,
          size.height *
              (wave == 0
                  ? 0.75
                  : 0.75 + wave > 1
                      ? 1
                      : 0.75 + wave),
          w,
          size.height *
              (wave == 0
                  ? 0.55
                  : 0.55 + wave > 1
                      ? 1
                      : 0.55 + wave))
      ..lineTo(w, size.height)
      ..lineTo(w, 0);

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
    /* canvas.drawPath(path, Paint()..color = Colors.blue); */
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
