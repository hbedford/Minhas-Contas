import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/cards_controller.dart';
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
  bool remember;
  @observable
  int widget = 0;
  @observable
  bool forgetSteps;
  @observable
  int forgetStep;
  @observable
  int pin;
  @observable
  int step = 0;
  _UserControllerBase(
      {this.user,
      this.step = 0,
      this.remember = false,
      this.forgetSteps = false});
  @computed
  Future<bool> get getUserInfo async {
    if (user.emailIsValid && user.passwordIsValid) {
      UserModel u =
          await UserDB().getUserWithEmailAndPassword(user.email, user.password);
      changeUser(u);
      return u != null;
    } else
      return false;
  }

  @action
  changePin(int p) => pin = p;
  @action
  changeForgetScreen(bool v) => forgetSteps = v;
  @action
  changeForgetStep(int s) => forgetStep = s;
  @action
  changeRemember(bool v) => remember = v;
  @action
  startLogIn(BuildContext context) async {
    /* if (user.emailIsValid && user.passwordIsValid) { */

    if (await getUserInfo) {
      final c = GetIt.I.get<CardsController>();
      c.changeCards(await CardDB().getCards(user.id));
      Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
    } else
      Navigator.pushReplacementNamed(context, '/login');
    /* } else
      Navigator.pushReplacementNamed(context, '/login');
  } */
  }

  @action
  logIn(BuildContext context) async {
    if (user.emailIsValid && user.passwordIsValid) {
      if (await getUserInfo) {
        final c = GetIt.I.get<CardsController>();
        c.changeCards(await CardDB().getCards(user.id));
        Navigator.pushReplacementNamed(context, '/home');
        if (remember)
          saveInfos();
        else
          cancelInfos();
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

  cancelInfos() async {
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString('email', null);
    s.setString('password', null);
  }

  getInfosShared(BuildContext context) async {
    SharedPreferences s = await SharedPreferences.getInstance();
    String email = s.getString('email');
    String password = s.getString('password');
    user.changeEmail(email);
    user.changePassword(password);
    startLogIn(context);
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
      int i = await UserDB().registerUser(
          UserModel(email: email, name: name, password: password));
      if (i != null && i > 0) {
        changeUser(
            UserModel(email: email, password: password, name: name, id: i));

        /* saveInfos(); */
        return true;
      } else {
        flushBar(
          message: 'Esse usuario ja existe no banco',
          color: Colors.red,
        ).show(context);
        return false;
      }
    }
  }

  @action
  addPin(BuildContext context) async {
    int i = (await UserDB().addPIN(pin, user.id));
    if (i > 0) {
      final c = GetIt.I.get<CardsController>();
      c.changeCards(await CardDB().getCards(user.id));
      Navigator.pushReplacementNamed(context, '/home');
      flushBar(
              message: 'Você se registrou com sucesso',
              title: 'Seja Bem vindo ${user.name}',
              color: Colors.green)
          .show(context);
    }
  }

  @action
  logOut(BuildContext context) async {
    final h = GetIt.instance<HomeController>();
    user = null;
    SharedPreferences s = await SharedPreferences.getInstance();
    s.setString('email', null);
    s.setString('password', null);
    h.changeIndex(0);
    Navigator.pushNamedAndRemoveUntil(context, '/', (route) => route.isFirst);
  }

  @action
  changeUser(UserModel u) => user = u;
  @action
  changeWidget(int i) => widget = i;
  @action
  changeStep(int i) => step = i;
}
