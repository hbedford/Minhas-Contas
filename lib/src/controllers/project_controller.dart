import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minhasconta/src/models/project_model.dart';
import 'package:mobx/mobx.dart';
part 'project_controller.g.dart';

class ProjectController = _ProjectControllerBase with _$ProjectController;

abstract class _ProjectControllerBase with Store {
  @observable
  TextEditingController editName;
  @observable
  DateTime date;
  @observable
  TimeOfDay time;
  @observable
  bool editTitle;
  @observable
  ProjectModel project;
  @observable
  int step;
  @observable
  bool haveDate;
  _ProjectControllerBase()
      : editName = TextEditingController(),
        editTitle = false,
        step = 1;
  @action
  changeProject(ProjectModel p) => project = p;
  @action
  changeStep(int value) => step = value;
  @action
  changeHaveDate(bool value) => haveDate = value;
  @action
  newProject() {
    changeProject(ProjectModel(color: Colors.grey, name: 'Novo projeto'));
  }
}
