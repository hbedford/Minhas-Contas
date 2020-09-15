import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/user_controller.dart';
import 'package:minhasconta/src/db/database.dart';

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
                  FlatButton(onPressed: () => null, child: Text('Acessar')),
                  FlatButton(
                      onPressed: () => null, child: Text('Registrar-ses'))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  loginWidget() => Column(children: [
        TextField(
          controller: email,
          decoration: InputDecoration(hintText: 'Email'),
        ),
        TextField(
          controller: password,
          decoration: InputDecoration(hintText: 'Senha'),
        ),
        RaisedButton(
          onPressed: () => c.logIn(email.text, password.text),
          child: Text('Entrar'),
        ),
      ]);
  registerWidget() => Column(
        children: [
          TextField(
            controller: name,
          ),
          TextField(
            controller: email,
          ),
          TextField(
            controller: password,
          ),
        ],
      );
}
