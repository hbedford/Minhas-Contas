import 'package:mobx/mobx.dart';
part 'user_model.g.dart';

class UserModel = _UserModelBase with _$UserModel;

abstract class _UserModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  String email;
  @observable
  String password;
  @observable
  String repeatPassword;
  _UserModelBase(
      {this.id,
      this.name = '',
      this.email = '',
      this.password = '',
      this.repeatPassword = ''});
  @action
  changeId(int i) => id = i;
  @action
  changeName(String n) => name = n;
  @action
  changeEmail(String e) => email = e;
  @action
  changePassword(String p) => password = p;
  @computed
  Map<String, dynamic> get registerToMap =>
      {'name': name, 'email': email, 'password': password};
}
