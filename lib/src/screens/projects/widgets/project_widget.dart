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
              child: CustomPaint(
                painter: WaveProjectPaint(
                    clipper: ProjectClipper(wave: animation.value)),
                child: ClipPath(
                  clipper: ProjectClipper(wave: animation.value),
                  child: widget.project.image == null
                      ? Container(
                          color: widget.project.color,
                        )
                      : Image.network(
                          widget.project.image,
                          colorBlendMode: BlendMode.darken,
                          color: Colors.black26.withOpacity(0.5),
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Container(
              height: widget.constraint.maxHeight,
              width: widget.constraint.maxWidth,
              child: AnimatedCrossFade(
                  firstChild: SizedBox(
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
                  secondChild: LayoutBuilder(
                    builder: (context, constraint) => Column(
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
                              horizontal: constraint.maxWidth * 0.1),
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
                                children: [
                                  {
                                    'title': 'Descrição de gasto',
                                    'value': 'R\$50,99'
                                  },
                                  {
                                    'title': 'Descrição de gasto',
                                    'value': 'R\$50,99'
                                  },
                                  {
                                    'title': 'Descrição de gasto',
                                    'value': 'R\$50,99'
                                  },
                                  {
                                    'title': 'Descrição de gasto',
                                    'value': 'R\$50,99'
                                  }
                                ]
                                    .map((e) => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              e['title'],
                                            ),
                                            Text(
                                              e['value'],
                                            )
                                          ],
                                        ))
                                    .toList(),
                              ),
                              FlatButton(
                                  onPressed: () => null,
                                  child: Text('ver mais')),
                              Container(
                                child: Divider(),
                                margin: EdgeInsets.symmetric(
                                    horizontal: constraint.maxWidth * 0.2),
                              ),
                              Text('Valor total do projeto até agora...'),
                              Column(
                                children: widget.project.categories
                                    .map(
                                      (e) => Row(
                                        children: [
                                          Text(e.name),
                                          Container(
                                            height:
                                                constraint.maxHeight * 0.025,
                                            width: (constraint.maxWidth * 0.8) *
                                                ((e.percent) / 100),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                color: Colors.blue),
                                          ),
                                          Text('R\$' + e.value),
                                        ],
                                      ),
                                    )
                                    .toList(),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  crossFadeState: !widget.wave
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(milliseconds: 200)),
            )
          ],
        ),
      ),
    );
  }
}
