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
  _UserModelBase.fromMap(Map map)
      : this.id = map['id'],
        this.name = map['name'],
        this.email = map['email'],
        this.password = map['password'];
  @action
  changeId(int i) => id = i;
  @action
  changeName(String n) => name = n;
  @action
  changeEmail(String e) => email = e;
  @action
  changePassword(String p) => password = p;
  @computed
  bool get emailIsValid =>
      email != null && email.length > 3 && email.contains('@');
  @computed
  bool get passwordIsValid => password != null && password.length > 3;
  @computed
  bool get repeatPasswordIsValid =>
      repeatPassword != null &&
      repeatPassword.length > 3 &&
      repeatPassword == password;
  @computed
  Map<String, dynamic> get map =>
      {'name': name, 'email': email, 'password': password};
}
