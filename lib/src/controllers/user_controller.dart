import 'package:flutter/material.dart';
import 'package:minhasconta/src/db/database.dart';
import 'package:minhasconta/src/models/user_model.dart';
import 'package:minhasconta/src/screens/home_screen.dart';
import 'package:minhasconta/src/widgets/flushbar_widget.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  UserModel user = UserModel();
  @observable
  int widget = 0;
  _UserControllerBase({this.user});
  @action
  logIn(String email, String password, BuildContext context) async {
    final db = DatabaseHelper.instance;
    if (email != null && email.contains('@') && password != null) {
      List list = (await db.getUserWithEmailAndPassword(email, password));

      if (list.length == 1) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
      } else
        flushBar(
          color: Colors.blue,
          title: 'Dados incorretos',
          message: 'Por favor verifique suas informação e tente novamente.',
        ).show(context);
    }
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
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
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
