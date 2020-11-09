import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/project_controller.dart';

class AddProjectWidget extends StatelessWidget {
  final c = GetIt.I.get<ProjectController>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Container(
        height: constraint.maxHeight * 0.6,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 2,
              child: Container(
                height: constraint.maxHeight * 0.15,
                width: constraint.maxWidth,
                child: Center(
                  child: Observer(
                      builder: (_) => FlatButton(
                          onPressed: () => c.editTitle, child: Text('Titulo'))),
                ),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(80),
                        bottomRight: Radius.circular(80))),
              ),
            ),
            Expanded(
                flex: 4,
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70),
                          topRight: Radius.circular(70))),
                ))
          ],
        ),
      ),
    );
  }
}
