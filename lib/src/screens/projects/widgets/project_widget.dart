import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:minhasconta/src/widgets/waveproject_widget.dart';

class ProjectWidget extends StatefulWidget {
  final ProjectModel project;
  final bool wave;
  /* 
  final BoxConstraints constraints; */
  final double height;
  final BoxConstraints constraint;
  final double width;
  final bool last;

  ProjectWidget(
      {this.project /* ,this.constraints */,
      this.height,
      this.constraint,
      this.width,
      this.wave = false,
      this.last = false});

  @override
  _ProjectWidgetState createState() => _ProjectWidgetState();
}

class _ProjectWidgetState extends State<ProjectWidget>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation animation;
  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 1).animate(controller)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.wave) {
      controller.forward();
    }
    return Material(
      type: MaterialType.transparency,
      color: Colors.transparent,
      child: AnimatedContainer(
        duration: Duration(seconds: 1),
        height: widget.wave ? widget.constraint.maxHeight * 0.8 : widget.height,
        /* list.indexOf(e) == 0
                                          ? constraints.maxHeight * 0.4
                                          : constraints.maxHeight * 0.4, */
        width: widget.width,
        child: Stack(
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: widget.wave
                  ? widget.constraint.maxHeight * 0.8
                  : widget.height,
              width: widget.width,
              child: ClipPath(
                clipper: ProjectClipper(wave: animation.value),
                child: Image.network(
                  widget.project.image,
                  colorBlendMode: BlendMode.darken,
                  color: Colors.black26.withOpacity(0.5),
                  /* filterQuality: FilterQuality.high, */
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: widget.last ? widget.height / 2 : widget.height,
              child: Center(
                child: Text(
                  widget.project.name,
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
