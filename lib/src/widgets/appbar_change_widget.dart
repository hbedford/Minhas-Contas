import 'package:flutter/material.dart';

class AppBarChangeWidget extends StatelessWidget {
  final BoxConstraints constraint;
  final String title;
  final Function back;
  final Function foward;
  AppBarChangeWidget(
      {@required this.constraint,
      @required this.title,
      @required this.back,
      @required this.foward});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: constraint.maxHeight * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: back,
            color: Colors.grey,
          ),
          Text(
            title,
            style: TextStyle(
                fontWeight: FontWeight.w700,
                color: Theme.of(context).primaryColor),
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            onPressed: foward,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }
}
