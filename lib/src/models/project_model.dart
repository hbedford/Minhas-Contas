import 'package:mobx/mobx.dart';
part 'project_model.g.dart';

class ProjectModel = _ProjectModelBase with _$ProjectModel;

abstract class _ProjectModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  _ProjectModelBase({this.id});
}
