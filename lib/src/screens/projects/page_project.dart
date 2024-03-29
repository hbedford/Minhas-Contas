import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/project_controller.dart';

import 'widgets/project_widget.dart';

class PageProject extends StatelessWidget {
  final p = GetIt.I.get<ProjectController>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Column(
        children: [
          ProjectWidget(
            wave: true,
            height: 300,
            width: 400,
            project: p.project,
          )
        ],
      ),
    );
  }
}
