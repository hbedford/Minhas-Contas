import 'package:flutter/material.dart';

class ProjectsScreen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraint) => SizedBox(
              height: constraint.maxHeight,
              child: Container(
                margin: EdgeInsets.symmetric(
                    horizontal: constraint.maxWidth * 0.05),
              ),
            ));
  }
}
