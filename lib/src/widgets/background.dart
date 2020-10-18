import 'package:flutter/material.dart';

class BackGround extends StatelessWidget {
  final Widget child;
  BackGround({this.child});
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: LayoutBuilder(
        builder: (context, constraint) => Stack(children: [
          Container(
            height: constraint.maxHeight,
            width: constraint.maxWidth,
            child: child,
            color: Theme.of(context).primaryColor,
          ),
        ]),
      ),
    );
  }
}
