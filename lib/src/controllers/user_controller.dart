import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:minhasconta/src/db/database.dart';
import 'package:minhasconta/src/models/user_model.dart';
import 'package:minhasconta/src/screens/home_screen.dart';
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
  logIn(String email, String password) async {
    final db = DatabaseHelper.instance;
    if (email != null && email.contains('@') && password != null) {
      Map map = (await db.getUserWithEmailAndPassword(email, password)).first;
      if(map ==null){
        Flushbar()
      }
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
        user.changeId(i);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        Flushbar(
          flushbarPosition: FlushbarPosition.BOTTOM,
          padding: EdgeInsets.all(8),
          flushbarStyle: FlushbarStyle.FLOATING,
        );
      }
    }
  }

  @action
  changeWidget(int i) => widget = i;
}
