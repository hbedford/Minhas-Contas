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
  _ProjectControllerBase()
      : editName = TextEditingController(),
        editTitle = false;
}
