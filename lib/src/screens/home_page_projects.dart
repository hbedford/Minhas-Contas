import 'package:flutter/material.dart';
import 'package:minhasconta/src/widgets/appbar_change_widget.dart';
import 'package:minhasconta/src/widgets/waveproject_widget.dart';

class HomePageProjects extends StatefulWidget {
  @override
  _HomePageProjectsState createState() => _HomePageProjectsState();
}

class _HomePageProjectsState extends State<HomePageProjects> {
  List list = [
    'assets/wallpaper1.jpg',
    'assets/wallpaper2.jpg',
    'assets/wallpaper3.jpg'
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
                        color: Colors.blue,
                        child: Stack(
                          children: list
                              .map((e) {
                                return AnimatedPositioned(
                                  duration: Duration(milliseconds: 200),
                                  top: (list.indexOf(e) * 1.2) *
                                      (constraints.maxHeight * 0.1),
                                  child: SizedBox(
                                    height: list.indexOf(e) == 0
                                        ? constraints.maxHeight * 0.3
                                        : constraints.maxHeight * 0.5,
                                    width: constraints.maxWidth,
                                    child: ClipPath(
                                      clipper: ProjectClipper(),
                                      child: Image.asset(
                                        e,
                                        fit: BoxFit.fill,
                                      ),
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
