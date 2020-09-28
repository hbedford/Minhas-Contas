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
  bool animate = false;
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();
  double keyboard = WidgetsBinding.instance.window.viewInsets.bottom;
  bool swap = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: LayoutBuilder(
        builder: (context, constraint) => SizedBox(
          height: constraint.maxHeight,
          width: constraint.maxWidth,
          child: Stack(children: [
            !swap ? registerWidget(constraint) : loginWidget(constraint),
            !swap ? loginWidget(constraint) : registerWidget(constraint),
          ]),
        ),
      ),
    );
  }

  loginWidget(BoxConstraints constraint) => AnimatedPositioned(
      duration: Duration(milliseconds: !animate ? 400 : 700),
      /*   curve: Curves.linear, */
      left: swap ? null : !animate ? constraint.maxWidth * 0.04 : 1.0,
      right: swap ? !animate ? constraint.maxWidth * 0.02 : 1.0 : null,
      child: AnimatedContainer(
        duration: Duration(milliseconds: !animate ? 400 : 100),
        margin: EdgeInsets.only(
          top: keyboard > 0.0
              ? !swap
                  ? constraint.maxHeight * 0.13
                  : constraint.maxHeight * 0.13
              : !swap
                  ? constraint.maxHeight * 0.23
                  : constraint.maxHeight * 0.15,
        ),
        height: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
            ? constraint.maxHeight * 0.75
            : constraint.maxHeight * 0.6,
        width: (constraint.maxWidth * 0.8) * (!animate ? 1 : 0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(85)),
          color: Colors.white,
        ),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: !animate ? 800 : 30),
          opacity: !animate ? 1.0 : 0.0,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: swap
                ? animate
                    ? null
                    : () {
                        setState(() {
                          animate = true;
                        });
                        Future.delayed(Duration(milliseconds: 600), () {
                          swap = false;
                          Future.delayed(Duration(milliseconds: 50), () {
                            setState(() {
                              animate = false;
                            });
                          });
                        });
                      }
                : null,
            child: Container(
              padding: EdgeInsets.only(
                  left: 20, right: 20, top: constraint.maxHeight * 0.03),
              child: LayoutBuilder(
                builder: (context, constraints) => Column(children: [
                  Container(
                      child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context)
                            .primaryColor
                            .withOpacity(swap ? 0.2 : 1.0)),
                  )),
                  Visibility(visible: !swap, child: loginInfo(constraints))
                ]),
              ),
            ),
          ),
        ),
      ));
  registerWidget(BoxConstraints constraint) => AnimatedPositioned(
      duration: Duration(milliseconds: !animate ? 100 : 700),
      curve: Curves.easeOut,
      right: swap ? null : !animate ? constraint.maxWidth * 0.04 : 1.0,
      left: swap ? !animate ? constraint.maxWidth * 0.02 : 1.0 : null,
      child: AnimatedContainer(
        duration: Duration(milliseconds: !animate ? 400 : 100),
        margin: EdgeInsets.only(
          top: keyboard > 0.0
              ? !swap
                  ? constraint.maxHeight * 0.13
                  : constraint.maxHeight * 0.13
              : !swap
                  ? constraint.maxHeight * 0.15
                  : constraint.maxHeight * 0.23,
        ),
        height: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
            ? constraint.maxHeight * 0.75
            : constraint.maxHeight * 0.6,
        width: (constraint.maxWidth * 0.8) * (!animate ? 1 : 0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
              topRight: Radius.circular(85)),
          color: Colors.white,
        ),
        child: AnimatedOpacity(
          duration: Duration(milliseconds: !animate ? 800 : 30),
          opacity: !animate ? 1.0 : 0.0,
          child: InkWell(
            splashColor: Colors.transparent,
            onTap: !swap
                ? animate
                    ? null
                    : () {
                        setState(() {
                          animate = true;
                        });
                        Future.delayed(Duration(milliseconds: 400), () {
                          swap = true;
                          Future.delayed(Duration(milliseconds: 600), () {
                            setState(() {
                              animate = false;
                            });
                          });
                        });
                      }
                : null,
            child: Container(
              padding: EdgeInsets.only(
                  left: 20, right: 20, top: constraint.maxHeight * 0.03),
              child: LayoutBuilder(
                builder: (context, constraints) => Column(children: [
                  Container(
                      child: Text(
                    'Cadastro',
                    style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.w700,
                        color: Theme.of(context)
                            .primaryColor
                            .withOpacity(swap ? 1.0 : 0.2)),
                  )),
                  Divider(),
                  Container(
                      child: Stack(
                    children: [
                      Container(
                        margin:
                            EdgeInsets.only(top: constraint.maxHeight * 0.003),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Observer(
                              builder: (_) => lineStep(c.step >= 0, constraint),
                            ),
                            Observer(
                              builder: (_) => lineStep(c.step >= 1, constraint),
                            ),
                            Observer(
                              builder: (_) => lineStep(c.step >= 1, constraint),
                            ),
                            Observer(
                              builder: (_) => lineStep(c.step >= 2, constraint),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: constraint.maxWidth * 0.34,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Observer(
                                  builder: (_) =>
                                      circleStep(c.step >= 0, constraint),
                                ),
                                Observer(
                                  builder: (_) =>
                                      circleStep(c.step >= 1, constraint),
                                ),
                                Observer(
                                  builder: (_) =>
                                      circleStep(c.step >= 2, constraint),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ))
                ]),
              ),
            ),
          ),
        ),
      ));
  lineStep(bool v, BoxConstraints constraint) => Container(
        height: constraint.maxHeight * 0.005,
        width: constraint.maxWidth * 0.08,
        decoration: BoxDecoration(
          border: Border.symmetric(
              vertical: BorderSide(color: Theme.of(context).backgroundColor)),
          color: v ? Theme.of(context).backgroundColor : Colors.white,
        ),
      );
  circleStep(bool v, BoxConstraints constraint) => Container(
      height: constraint.maxWidth * 0.02,
      width: constraint.maxWidth * 0.02,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).backgroundColor),
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: v ? Theme.of(context).backgroundColor : Colors.white));
  loginInfo(BoxConstraints constraints) => Column(
        children: [
          Container(
            margin: EdgeInsets.only(
                top: constraints.maxHeight * 0.08,
                bottom: constraints.maxHeight * 0.01),
            child: Divider(
              color: Colors.grey,
            ),
          ),
          Container(
              height: constraints.maxHeight * 0.23,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        left: constraints.maxWidth * 0.1,
                        bottom: constraints.maxHeight * 0.01),
                    child: Text('E-mail'),
                  ),
                  Container(
                    height: constraints.maxHeight * 0.13,
                    child: TextField(
                        controller: email,
                        decoration: InputDecoration(
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(30.0),
                            ),
                          ),
                        )),
                  )
                ],
              )),
          textField(
              controller: password, constraints: constraints, title: 'Senha'),
          RaisedButton(
              onPressed: () {
                c.changeUser(
                    UserModel(email: email.text, password: password.text));
                c.logIn(context);
              },
              child: Text(
                'Entrar',
                style: Theme.of(context).primaryTextTheme.button,
              )),
          Column(children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              FlatButton(
                onPressed: () => null,
                child: Row(
                  children: [
                    Icon(Icons.check_box_outline_blank),
                    Text('Lembrar meus dados')
                  ],
                ),
              )
            ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Precisa de ajuda?'),
              ],
            ),
          ])
        ],
      );
  textField({
    TextEditingController controller,
    BoxConstraints constraints,
    String title,
  }) =>
      Container(
        height: constraints.maxHeight * 0.23,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(
                    left: constraints.maxWidth * 0.1,
                    bottom: constraints.maxHeight * 0.01),
                child: Text(title)),
            Container(
              height: constraints.maxHeight * 0.13,
              child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    border: new OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: const BorderRadius.all(
                        const Radius.circular(30.0),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      );
}
