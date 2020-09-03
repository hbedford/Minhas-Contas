import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'project_model.g.dart';

class ProjectModel = _ProjectModelBase with _$ProjectModel;

abstract class _ProjectModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  Color color;
  _ProjectModelBase({this.id, this.name, this.color = Colors.white});
}
