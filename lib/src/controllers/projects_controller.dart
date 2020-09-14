import 'package:minhasconta/src/models/project_model.dart';
import 'package:mobx/mobx.dart';
part 'projects_controller.g.dart';

class ProjectsController = _ProjectsControllerBase with _$ProjectsController;

abstract class _ProjectsControllerBase with Store {
  @observable
  ProjectModel project;
  @observable
  ObservableList projects = [].asObservable();
  _ProjectsControllerBase({this.project, this.projects});
  @action
  changeProject(ProjectModel p) => project = p;
  @action
  addProject(ProjectModel p) => projects.add(p);
  @action
  removeProject(ProjectModel p) => projects.remove(p);
}
