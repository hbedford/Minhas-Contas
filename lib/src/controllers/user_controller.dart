import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/db/database.dart';
import 'package:minhasconta/src/models/user_model.dart';
import 'package:minhasconta/src/widgets/flushbar_widget.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_controller.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  UserModel user = UserModel();
  @observable
  int widget = 0;
  _UserControllerBase({this.user});
  @computed
  Future<bool> get getUserInfo async {
    final db = DatabaseHelper.instance;
    print(user.email);
    UserModel u =
        await db.getUserWithEmailAndPassword(user.email, user.password);
    if (u != null) changeUser(u);
    print(u != null);
    return u != null;
  }

  @action
  startLogIn(BuildContext context) async {
    print(user.email);
    print(user.emailIsValid);
    if (user.emailIsValid && user.passwordIsValid) {
      if (await getUserInfo) {
        Navigator.pushReplacementNamed(context, '/home');
      } else
        Navigator.pushReplacementNamed(context, '/login');
    } else
      Navigator.pushReplacementNamed(context, '/login');
  }

  @action
  logIn(BuildContext context) async {
    if (user.emailIsValid && user.passwordIsValid) {
      if (await getUserInfo) {
        Navigator.pushReplacementNamed(context, '/home');
        saveInfos();
        return true;
      } else {
        flushBar(
          color: Colors.blue,
          title: 'Dados incorretos',
          message: 'Por favor verifique suas informação e tente novamente.',
        ).show(context);
        return false;
      }
    } else
      return false;
  }

  saveInfos() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString('email', user.email);
    s.setString('password', user.password);
  }

  Future<bool> getInfosShared() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String email = s.getString('email');
    String password = s.getString('password');
    changeUser(UserModel(email: email, password: password));
    return true;
  }

  @action
  register(String email, String name, String password, String repeatPassword,
      BuildContext context) async {
    if (email != null &&
        email.contains('@') &&
        password != null &&
        repeatPassword != null &&
        password == repeatPassword &&
        name != null) {
      final db = DatabaseHelper.instance;
      int i = (await db.registerUser(
          UserModel(email: email, name: name, password: password)));
      if (i != null) {
        changeUser(
            UserModel(email: email, password: password, name: name, id: i));

        saveInfos();
        Navigator.pushReplacementNamed(context, '/home');
        flushBar(
                message: 'Você se registrou com sucesso',
                title: 'Seja Bem vindo $name',
                color: Colors.green)
            .show(context);
      } else {
        flushBar(
                title: 'Esse usuario ja existe no banco',
                message: '',
                color: Colors.red)
            .show(context);
      }
    }
  }

  @action
  changeUser(UserModel u) => user = u;
  @action
  changeWidget(int i) => widget = i;
}
