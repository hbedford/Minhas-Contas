// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'projects_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProjectsController on _ProjectsControllerBase, Store {
  Computed<List<dynamic>> _$pForListComputed;

  @override
  List<dynamic> get pForList =>
      (_$pForListComputed ??= Computed<List<dynamic>>(() => super.pForList,
              name: '_ProjectsControllerBase.pForList'))
          .value;
  Computed<List<dynamic>> _$durationsComputed;

  @override
  List<dynamic> get durations =>
      (_$durationsComputed ??= Computed<List<dynamic>>(() => super.durations,
              name: '_ProjectsControllerBase.durations'))
          .value;

  final _$projectAtom = Atom(name: '_ProjectsControllerBase.project');

  @override
  ProjectModel get project {
    _$projectAtom.reportRead();
    return super.project;
  }

  @override
  set project(ProjectModel value) {
    _$projectAtom.reportWrite(value, super.project, () {
      super.project = value;
    });
  }

  final _$projectsAtom = Atom(name: '_ProjectsControllerBase.projects');

  @override
  ObservableList<dynamic> get projects {
    _$projectsAtom.reportRead();
    return super.projects;
  }

  @override
  set projects(ObservableList<dynamic> value) {
    _$projectsAtom.reportWrite(value, super.projects, () {
      super.projects = value;
    });
  }

  final _$_ProjectsControllerBaseActionController =
      ActionController(name: '_ProjectsControllerBase');

  @override
  dynamic changeProject(ProjectModel p) {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.changeProject');
    try {
      return super.changeProject(p);
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic addProject(ProjectModel p) {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.addProject');
    try {
      return super.addProject(p);
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeProject(ProjectModel p) {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.removeProject');
    try {
      return super.removeProject(p);
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeProjects(ObservableList<dynamic> l) {
    final _$actionInfo = _$_ProjectsControllerBaseActionController.startAction(
        name: '_ProjectsControllerBase.changeProjects');
    try {
      return super.changeProjects(l);
    } finally {
      _$_ProjectsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
project: ${project},
projects: ${projects},
pForList: ${pForList},
durations: ${durations}
    ''';
  }
}
