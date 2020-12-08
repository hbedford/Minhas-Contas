import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:minhasconta/src/widgets/waveproject_widget.dart';

class ProjectWidget extends StatelessWidget {
  final ProjectModel project;
  final double wave;
  /* 
  final BoxConstraints constraints; */
  final double height;
  final double width;
  final bool last;

  ProjectWidget(
      {this.project /* ,this.constraints */,
      this.height,
      this.width,
      this.wave,
      this.last = false});
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      color: Colors.transparent,
      child: SizedBox(
        height: height,
        /* list.indexOf(e) == 0
                                          ? constraints.maxHeight * 0.4
                                          : constraints.maxHeight * 0.4, */
        width: width,
        child: Stack(
          children: [
            SizedBox(
              height: height,
              width: width,
              child: ClipPath(
                clipper: ProjectClipper(wave: wave),
                child: Image.network(
                  project.image,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black26.withOpacity(0.5),
                  /* filterQuality: FilterQuality.high, */
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: last ? height / 2 : height,
              child: Center(
                child: Text(
                  project.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
