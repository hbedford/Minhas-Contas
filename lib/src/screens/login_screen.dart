import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/user_controller.dart';
import 'package:minhasconta/src/db/database.dart';
import 'package:minhasconta/src/models/user_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final dbHelper = DatabaseHelper.instance;
  final c = GetIt.instance<UserController>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  InkWell(
                      onTap: () => c.changeWidget(0), child: Text('Acessar')),
                  Text(' / '),
                  InkWell(
                      onTap: () => c.changeWidget(1),
                      child: Text('Registrar-se'))
                ],
              ),
              Observer(
                  builder: (_) => c.widget == 0
                      ? loginWidget(context)
                      : c.widget == 1
                          ? registerWidget(context)
                          : recoverPassword())
            ],
          ),
        ),
      ),
    );
  }

  loginWidget(BuildContext context) => Column(children: [
        TextField(
          controller: email,
          decoration: InputDecoration(hintText: 'Email'),
        ),
        TextField(
          controller: password,
          decoration: InputDecoration(hintText: 'Senha'),
        ),
        RaisedButton(
          onPressed: () {
            c.changeUser(UserModel(email: email.text, password: password.text));
            c.logIn(context);
          },
          child: Text('Entrar'),
        ),
      ]);
  registerWidget(BuildContext context) => Column(
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Nome'),
            controller: name,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Email'),
            controller: email,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Senha'),
            controller: password,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Repetir senha'),
            controller: repeatPassword,
          ),
          RaisedButton(
              child: Text('Registrar'),
              onPressed: () => c.register(email.text, name.text, password.text,
                  repeatPassword.text, context))
        ],
      );
  recoverPassword() => Column(children: []);
}
