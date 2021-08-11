import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/project_controller.dart';
import 'package:minhasconta/src/models/project_model.dart';

class NewProjectWidget extends StatefulWidget {
  final ProjectModel project;
  final bool wave;
  final double height;
  final BoxConstraints constraint;
  final double width;
  final bool last;

  NewProjectWidget(
      {this.project /* ,this.constraints */,
      this.height,
      this.constraint,
      this.width,
      this.wave = false,
      this.last = false});

  @override
  _NewProjectWidgetState createState() => _NewProjectWidgetState();
}

class _NewProjectWidgetState extends State<NewProjectWidget>
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
          duration: Duration(milliseconds: 200),
          color: widget.wave ? widget.project.color : Colors.grey,
          height:
              widget.wave ? widget.constraint.maxHeight * 0.8 : widget.height,
          width: widget.width,
          child: Container(
            height: widget.constraint.maxHeight,
            width: widget.constraint.maxWidth,
            child: AnimatedCrossFade(
                firstChild: SizedBox(
                  height: widget.last ? widget.height / 2 : widget.height,
                  width: widget.width,
                  child: widget.project == null
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              vertical: widget.height * 0.2),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Adicionar Projeto'),
                              Icon(Icons.add),
                            ],
                          ),
                        )
                      : Center(
                          child: Text(
                            widget.project.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(color: Colors.white),
                          ),
                        ),
                ),
                secondChild: widget.project == null || widget.project.id == null
                    ? newProject()
                    : actualProject(),
                crossFadeState: !widget.wave
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: Duration(milliseconds: 200)),
          )),
    );
  }

  newProject() => Column(
        children: [Step1Project()],
      );
  actualProject() => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  icon: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                    size: 40,
                  ),
                  onPressed: null)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                widget.project.name,
              ),
              widget.project.icon,
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: widget.constraint.maxWidth * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      'Gastos até agora',
                    )
                  ],
                ),
                Column(
                  children: widget.project.payments
                      .map((e) => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                e.name,
                              ),
                              Text(
                                e.value.toString() ?? '',
                              )
                            ],
                          ))
                      .toList(),
                ),
                TextButton(onPressed: () => null, child: Text('ver mais')),
                Container(
                  child: Divider(),
                  margin: EdgeInsets.symmetric(
                      horizontal: widget.constraint.maxWidth * 0.2),
                ),
                Text('Valor total do projeto até agora...'),
                Column(
                  children: widget.project.categories
                      .map(
                        (e) => Row(
                          children: [
                            Text(e.name),
                            Container(
                              height: widget.constraint.maxHeight * 0.025,
                              width: (widget.constraint.maxWidth * 0.8) *
                                  ((e.percent) / 100),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue),
                            ),
                            Text('R\$' + (e.total.toString() ?? '')),
                          ],
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          )
        ],
      );
}

class Step1Project extends StatelessWidget {
  final controller = GetIt.I.get<ProjectController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text('O projeto tem algum prazo?'),
        Row(
          children: [
            ElevatedButton(
                onPressed: () => controller.changeHaveDate(true),
                child: Text('Sim'.toUpperCase())),
            ElevatedButton(onPressed: () => null, child: Text('Não'))
          ],
        )
      ]),
    );
  }
}
