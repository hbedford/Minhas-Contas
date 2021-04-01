import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/project_controller.dart';
import 'package:minhasconta/src/controllers/projects_controller.dart';
import 'package:minhasconta/src/screens/projects/widgets/new_project_widget.dart';
import 'package:minhasconta/src/screens/projects/widgets/project_widget.dart';
import 'package:minhasconta/src/widgets/appbar_change_widget.dart';

class HomePageProjects extends StatefulWidget {
  @override
  _HomePageProjectsState createState() => _HomePageProjectsState();
}

class _HomePageProjectsState extends State<HomePageProjects> {
/*   final p = GetIt.I.get<ProjectController>(); */
  final p = GetIt.I.get<ProjectsController>();
  final pNew = GetIt.I.get<ProjectController>();

  @override
  Widget build(BuildContext context) {
    /* timeDilation = 5.0; */
    return SafeArea(
        child: LayoutBuilder(
            builder: (context, constraints) => Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: Column(
                    children: [
                      AppBarChangeWidget(
                          constraint: constraints,
                          title: 'Projetos',
                          back: () => null,
                          foward: () => null),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: constraints.maxWidth * 0.6,
                            child: Divider(
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            'Projetos em andamento',
                            style: TextStyle(color: Colors.black26),
                          )
                        ],
                      ),
                      Expanded(
                          child: Container(
                        child: Observer(
                          builder: (_) => Stack(
                              children: p.pForList
                                  .map((e) {
                                    int i = p.pForList.indexOf(e);
                                    if (e != null)
                                      return AnimatedPositioned(
                                        left: pNew.project == null
                                            ? 0
                                            : -constraints.maxWidth,
                                        duration: Duration(
                                            milliseconds: p.durations[i] * 100),
                                        top: i *
                                            ((constraints.maxHeight * 0.3) *
                                                0.55),
                                        child: InkWell(
                                          onTap: () {
                                            /*  if (p.project == null) p.changeProject(e); */
                                          },
                                          child: Observer(
                                            builder: (_) => AnimatedOpacity(
                                              opacity: p.project == null
                                                  ? 1.0
                                                  : e == p.project
                                                      ? 1.0
                                                      : 0.0,
                                              duration: Duration(seconds: 1),
                                              child: ProjectWidget(
                                                project: e,
                                                wave: e == p.project,
                                                constraint: constraints,
                                                height: i == 0
                                                    ? constraints.maxHeight *
                                                        0.3
                                                    : constraints.maxHeight *
                                                        0.3,
                                                width: constraints.maxWidth,
                                                first: p.projects.first == e,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    else
                                      return AnimatedPositioned(
                                          top: pNew.project != null
                                              ? 0
                                              : (p.pForList.length - 1) *
                                                  ((constraints.maxHeight *
                                                          0.3) *
                                                      0.55),
                                          child: InkWell(
                                            onTap: () => pNew.project == null
                                                ? pNew.newProject()
                                                : pNew.changeProject(null),
                                            child: Observer(
                                              builder: (_) => NewProjectWidget(
                                                project: pNew.project,
                                                wave: pNew.project != null,
                                                constraint: constraints,
                                                height:
                                                    constraints.maxHeight * 0.2,
                                                width: constraints.maxWidth,
                                                last: false,
                                              ),
                                            ),
                                          ),
                                          duration:
                                              Duration(milliseconds: 200));
                                  })
                                  .toList()
                                  .reversed
                                  .toList()),
                        ),
                      )),
                    ],
                  ),
                )));
  }
}
