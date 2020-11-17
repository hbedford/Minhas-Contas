import 'dart:io';

import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CurvedNavigationBar extends StatefulWidget {
  final List<Widget> items;
  final int index;
  final Color color;
  final Color buttonBackgroundColor;
  final Color backgroundColor;
  final ValueChanged<int> onTap;
  final Curve animationCurve;
  final Duration animationDuration;
  final double height;
  final double width;

  CurvedNavigationBar({
    Key key,
    @required this.items,
    this.index = 0,
    this.color = Colors.white,
    this.buttonBackgroundColor,
    this.backgroundColor = Colors.blueAccent,
    this.onTap,
    this.animationCurve = Curves.easeOut,
    this.animationDuration = const Duration(milliseconds: 600),
    this.width,
    this.height = 75.0,
  })  : assert(items != null),
        assert(items.length >= 1),
        assert(0 <= index && index < items.length),
        assert(0 <= height /*&& height <= 75.0*/),
        super(key: key);

  @override
  CurvedNavigationBarState createState() => CurvedNavigationBarState();
}

class CurvedNavigationBarState extends State<CurvedNavigationBar>
    with SingleTickerProviderStateMixin {
  double _pos;
  AnimationController _animationController;
  int _length;

  @override
  void initState() {
    super.initState();
    _length = widget.items.length;
    _pos = widget.index / _length;
    _animationController = AnimationController(value: _pos, vsync: this);
    _animationController
        .addListener(() => setState(() => _pos = _animationController.value));
  }

  @override
  void didUpdateWidget(CurvedNavigationBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.index != widget.index) {
      final newPosition = widget.index / _length;
      _animationController.animateTo(newPosition,
          duration: widget.animationDuration, curve: widget.animationCurve);
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height,
        width: widget.width,
        child: Stack(
            overflow: Overflow.visible,
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: CustomPaint(
                      painter: NavCustomPainter(_pos, _length,
                          widget.backgroundColor, Directionality.of(context)),
                      child: Container(height: widget.height * 0.60))),
              Positioned(
                  left: 0,
                  right: 0,
                  top: 0,
                  bottom: 0,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: widget.items
                          .map((item) => Expanded(
                              child: InkWell(
                                  splashColor: Colors.transparent,
                                  onTap: () => setState(() =>
                                      widget.onTap(widget.items.indexOf(item))),
                                  child: AnimatedContainer(
                                    margin: EdgeInsets.only(
                                        bottom: widget.items.indexOf(item) ==
                                                widget.index
                                            ? Platform.isIOS
                                                ? 30
                                                : 20
                                            : Platform.isIOS
                                                ? 20
                                                : 0),
                                    child: CircleAvatar(
                                      backgroundColor: widget.backgroundColor,
                                      child: Center(child: item),
                                    ),
                                    duration: Duration(milliseconds: 200),
                                  ))))
                          .toList()))
            ]));
  }

  void setPage(int index) => _buttonTap(index);

  void _buttonTap(int index) {
    if (widget.onTap != null) widget.onTap(index);

    final newPosition = index / _length;
    setState(() => _animationController.animateTo(newPosition,
        duration: widget.animationDuration, curve: widget.animationCurve));
  }
}

class NavCustomPainter extends CustomPainter {
  double loc;
  double s;
  Color color;
  TextDirection textDirection;

  NavCustomPainter(
      double startingLoc, int itemsLength, this.color, this.textDirection) {
    final span = 1.0 / itemsLength;
    s = 0.2;
    double l = startingLoc + (span - s) / 2;
    loc = textDirection == TextDirection.rtl ? 0.8 - l : l;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo((loc - 0.00) * size.width, 0)
      ..cubicTo(
        (loc + s * 0.20) * size.width,
        size.height * 0.05,
        loc * size.width,
        size.height * 0.60,
        (loc + s * 0.50) * size.width,
        size.height * 0.60,
      )
      ..cubicTo(
        (loc + s) * size.width,
        size.height * 0.60,
        (loc + s - s * 0.20) * size.width,
        size.height * 0.05,
        (loc + s + 0.0) * size.width,
        0,
      )
      ..lineTo(size.width, 0)
      /* ..lineTo(size.width - 30, 0) */
      /*  ..quadraticBezierTo(
          size.width, size.height * 0.5, size.width * 0.95, size.height) */
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      /* ..quadraticBezierTo(size.width * 0.1, size.height * 0.9, size.width * 0.1,
          size.height * 0.9) */
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => this != oldDelegate;
}
