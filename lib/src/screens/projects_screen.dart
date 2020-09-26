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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: constraint.maxWidth * 0.3,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [Text('Você tem'), Text('projetos')],
                    ),
                    Column(
                      children: [
                        Text(c.projects.length.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Flexible(
            child: Text('Em andamento'),
          ),
          Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, int index) => Container())),
          Flexible(
            child: Text('Concluidos'),
          ),
          Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, int index) => Container())),
          Flexible(
            child: Text('Cancelados'),
          ),
          Flexible(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, int index) => Container())),
        ]),
      ),
    );
  }
}
