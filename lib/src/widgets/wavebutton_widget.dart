import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WaveButton extends CustomPainter {
  final double percent;
  final double total;
  final Color color;
  WaveButton({this.percent, this.total, this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final path = Path();
    double w = size.width;
    print(percent);
    if (percent < 20) {
      /* path.moveTo(x, y) */
    } else if (percent >= 20 && percent < 25) {
      path.moveTo(w * (percent / 100), -size.height * 0.2);

      path.quadraticBezierTo(w * ((percent + 10) / 100), size.height * 0.25,
          w * (percent / 100), size.height * 0.5);
      path.quadraticBezierTo(w * ((percent - 10) / 100), size.height * 0.75,
          w * ((percent - 10) / 100), size.height);
    } else if (percent >= 25 && percent < 60) {
      path.moveTo(w * ((percent - 10) / 100), -size.height * 0.2);

      path.quadraticBezierTo(w * ((percent + 10) / 100), size.height * 0.25,
          w * (percent / 100), size.height * 0.5);
      path.quadraticBezierTo(w * ((percent - 10) / 100), size.height * 0.75,
          w * ((percent + 5) / 100), size.height);
    } else if (percent >= 60 && percent < 80) {}
    path.lineTo(-w, size.height);
    path.lineTo(-w, 0);

    /* path.moveTo(w * (0.2), -size.height * 0.2);

    path.quadraticBezierTo(
        w * 0.3, size.height * 0.25, w * 0.2, size.height * 0.5);
    path.quadraticBezierTo(w * 0.1, size.height * 0.75, w * 0.3, size.height);

    path.lineTo(-w, size.height);
    path.lineTo(-w, 0); */
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
