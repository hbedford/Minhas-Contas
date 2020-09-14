import 'package:flutter/material.dart';
import 'package:minhasconta/src/db/database.dart';

class LoginScreen extends StatelessWidget {
  final dbHelper = DatabaseHelper.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          margin: EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.1),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Email'),
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Senha'),
              ),
              RaisedButton(
                onPressed: () => null,
                child: Text('Entrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
