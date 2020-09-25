import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/projects_controller.dart';

class ProjectsScreen extends StatelessWidget {
  final c = GetIt.instance<ProjectsController>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) => Container(
        margin: EdgeInsets.symmetric(horizontal: constraint.maxWidth * 0.05),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [Text('Você tem'), Text('projetos')],
                ),
                Column(children: [
                  Text(c.projects.length.toString(),
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.w900))
                ])
              ],
            ),
          ),
          Text('Em andamento'),
          Text('Concluidos'),
          Text('Cancelados'),
        ]),
      ),
    );
  }
}
