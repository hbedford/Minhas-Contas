import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/projects_controller.dart';
import 'package:minhasconta/src/models/category_model.dart';
import 'package:minhasconta/src/models/payment_model.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:minhasconta/src/screens/projects/widgets/project_widget.dart';
import 'package:minhasconta/src/widgets/appbar_change_widget.dart';
import 'package:mobx/mobx.dart';

class HomePageProjects extends StatefulWidget {
  @override
  _HomePageProjectsState createState() => _HomePageProjectsState();
}

class _HomePageProjectsState extends State<HomePageProjects> {
/*   final p = GetIt.I.get<ProjectController>(); */
  final p = GetIt.I.get<ProjectsController>();

  @override
  Widget build(BuildContext context) {
    ObservableList pList =
        [PaymentModel(value: 20.00, name: 'Tinta')].asObservable();
    ObservableList l = [
      CategoryModel(
          name: 'Material',
          percent: 20,
          payments:
              ObservableList.of([PaymentModel(name: 'Arroz', value: 20.00)]))
    ].asObservable();
    p.changeProjects(ObservableList.of([
      ProjectModel(
          id: 0,
          name: 'Pintura do predio/escritório',
          color: Colors.blue,
          icon: Icon(
            Icons.format_paint,
          ),
          payments: pList,
          categories: l,
          image:
              'https://images.unsplash.com/photo-1593623671658-6b842c7f9697?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1202&q=80'),
      ProjectModel(
          id: 1,
          name: 'Monitor para o RH',
          color: Colors.yellow,
          payments: [].asObservable(),
          icon: Icon(
            Icons.monitor,
          ),
          categories: l,
          image:
              'https://images.unsplash.com/photo-1593623671658-6b842c7f9697?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1202&q=80'),
      ProjectModel(
          id: 2,
          name: 'Viajem no fim de ano',
          color: Colors.green,
          payments: [].asObservable(),
          icon: Icon(
            Icons.card_travel,
          ),
          categories: l,
          image:
              "https://images.unsplash.com/photo-1469854523086-cc02fe5d8800?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1308&q=80"),
    ]));
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
                      Expanded(
                          child: Container(
                        child: Stack(
                            children: (p.projects.map((e) {
                          return AnimatedPositioned(
                              duration: Duration(milliseconds: 200),
                              top: p.projects.indexOf(e) *
                                  ((constraints.maxHeight * 0.3) * 0.55),
                              child: InkWell(
                                onTap: () {
                                  if (p.project == null) p.changeProject(e);
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
                                      height: p.projects.indexOf(e) == 0
                                          ? constraints.maxHeight * 0.3
                                          : constraints.maxHeight * 0.4,
                                      width: constraints.maxWidth,
                                      last: p.projects.first == e,
                                    ),
                                  ),
                                ),
                              ));
                        }).toList()
                                  ..add(AnimatedPositioned(
                                      top: (p.projects.length) *
                                          ((constraints.maxHeight * 0.3) *
                                              0.55),
                                      child: InkWell(
                                        child: ProjectWidget(
                                          project: null,
                                          wave: false,
                                          constraint: constraints,
                                          height: constraints.maxHeight * 0.3,
                                          width: constraints.maxWidth,
                                          last: false,
                                        ),
                                      ),
                                      duration: Duration(seconds: 2))))
                                .reversed
                                .toList()),
                      )),
                    ],
                  ),
                )));
  }
}
