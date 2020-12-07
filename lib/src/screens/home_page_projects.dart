import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:minhasconta/src/widgets/appbar_change_widget.dart';
import 'package:minhasconta/src/widgets/waveproject_widget.dart';

class HomePageProjects extends StatefulWidget {
  @override
  _HomePageProjectsState createState() => _HomePageProjectsState();
}

class _HomePageProjectsState extends State<HomePageProjects> {
  List list = [
    ProjectModel(
        id: 0,
        name: 'Pintura do predio/escritório',
        image: 'assets/wallpaper1.jpg'),
    ProjectModel(
        id: 1, name: 'Monitor para o RH', image: 'assets/wallpaper2.jpg'),
    ProjectModel(
        id: 2, name: 'Viajem no fim de ano', image: 'assets/wallpaper3.jpg'),
  ];
  @override
  Widget build(BuildContext context) {
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
                          children: list
                              .map((e) {
                                return AnimatedPositioned(
                                  duration: Duration(milliseconds: 200),
                                  top: (e * 1.2) *
                                      (constraints.maxHeight * 0.15),
                                  child: SizedBox(
                                    height: list.indexOf(e) == 0
                                        ? constraints.maxHeight * 0.4
                                        : constraints.maxHeight * 0.4,
                                    width: constraints.maxWidth,
                                    child: Stack(
                                      children: [
                                        SizedBox(
                                          width: constraints.maxWidth,
                                          child: ClipPath(
                                            clipper: ProjectClipper(),
                                            child: Image.asset(
                                              'assets/wallpaper${(e + 1).toString()}.jpg',
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Text('A'),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              })
                              .toList()
                              .reversed
                              .toList(),
                        ),
                      ))
                    ],
                  ),
                )));
  }
}
