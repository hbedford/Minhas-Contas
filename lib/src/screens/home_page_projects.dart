import 'package:flutter/material.dart';
import 'package:minhasconta/src/widgets/appbar_change_widget.dart';
import 'package:minhasconta/src/widgets/waveproject_widget.dart';

class HomePageProjects extends StatefulWidget {
  @override
  _HomePageProjectsState createState() => _HomePageProjectsState();
}

class _HomePageProjectsState extends State<HomePageProjects> {
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
                      SizedBox(
                          child: CustomPaint(
                        size: Size(
                            constraints.maxWidth, constraints.maxWidth * 0.5),
                        painter: ProjectClipper(),
                        /* child: */ /* Container(
                                  height: 500,
                                  width: 500,
                                  color: Colors
                                      .blue) */ /* Observer(
                      builder: (_) => CustomPaint(
                          size: Size(constraint.maxWidth * 0.15,
                              constraint.maxWidth * 0.15),
                          painter:
                              WaveButton(percent: p.percent, color: color)),
                    ) */
                      )),
                    ],
                  ),
                )));
  }
}
