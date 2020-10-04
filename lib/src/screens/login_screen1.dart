import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:minhasconta/src/controllers/user_controller.dart';
import 'package:minhasconta/src/db/database.dart';
import 'package:minhasconta/src/models/user_model.dart';
import 'package:minhasconta/src/utils/pin_fields.dart';

class LoginScreen1 extends StatefulWidget {
  @override
  _LoginScreen1State createState() => _LoginScreen1State();
}

class _LoginScreen1State extends State<LoginScreen1> {
  final dbHelper = DatabaseHelper.instance;
  final c = GetIt.instance<UserController>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  bool animate = false;
  TextEditingController password = TextEditingController();
  TextEditingController repeatPassword = TextEditingController();
  double keyboard = WidgetsBinding.instance.window.viewInsets.bottom;
  bool swap = false;
  bool loginClick = false;
  bool registerClick = false;
  Color yellow = Color(0xffFFC557);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraint) => Observer(
          builder: (_) => Container(
            height: constraint.maxHeight,
            width: constraint.maxWidth,
            child: AnimatedCrossFade(
                firstChild: Stack(children: [
                  !swap ? registerWidget(constraint) : loginWidget(constraint),
                  !swap ? loginWidget(constraint) : registerWidget(constraint),
                ]),
                secondChild: Stack(children: [
                  Container(
                      height: constraint.maxHeight,
                      width: constraint.maxWidth,
                      child: InkWell(
                        onTap: c.forgetSteps
                            ? () => c.changeForgetScreen(false)
                            : null,
                      )),
                  cardWidget(
                    constraint,
                    EdgeInsets.only(
                        top: constraint.maxHeight * 0.23,
                        left: constraint.maxWidth * 0.1),
                    Container(
                        padding: EdgeInsets.symmetric(
                            vertical: constraint.maxHeight * 0.05,
                            horizontal: constraint.maxWidth * 0.02),
                        child: InkWell(onTap: null, child: forgetSteps())),
                  ),
                  Positioned(
                      top: constraint.maxHeight * 0.22,
                      left: constraint.maxWidth * 0.08,
                      child: InkWell(
                          onTap: () => c.changeForgetScreen(false),
                          child: CircleAvatar(child: Text('x')))),
                ]),
                crossFadeState: c.forgetSteps
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: Duration(milliseconds: 500)),
          ),
        ),
      ),
    );
  }

  cardWidget(BoxConstraints constraint, EdgeInsets edgeInsets, Widget child) =>
      AnimatedContainer(
          duration: Duration(milliseconds: !animate ? 400 : 100),
          margin: edgeInsets,
          height: WidgetsBinding.instance.window.viewInsets.bottom > 0.0
              ? constraint.maxHeight * 0.75
              : constraint.maxHeight * 0.6,
          width: constraint.maxWidth * 0.8,
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
          child: child);
  cardAnimated(
          {List<Widget> children,
          BoxConstraints constraint,
          Function f,
          bool loginWidget}) =>
      AnimatedPositioned(
          onEnd: loginWidget && loginClick || !loginWidget && registerClick
              ? () => setState(() {
                    if (swap)
                      swap = false;
                    else
                      swap = true;
                    animate = false;
                    loginClick = false;
                    registerClick = false;
                  })
              : null,
          duration: Duration(milliseconds: !animate ? 100 : 100),
          curve: Curves.easeOut,
          right: loginWidget
              ? (swap
                  ? !animate
                      ? constraint.maxWidth * 0.02
                      : -constraint.maxWidth * 1
                  : null)
              : (swap
                  ? null
                  : !animate
                      ? constraint.maxWidth * 0.04
                      : -constraint.maxWidth * 1),
          left: loginWidget
              ? (swap
                  ? null
                  : !animate
                      ? constraint.maxWidth * 0.04
                      : -constraint.maxWidth * 1)
              : (swap
                  ? !animate
                      ? constraint.maxWidth * 0.02
                      : -constraint.maxWidth * 1
                  : null),
          child: cardWidget(
            constraint,
            EdgeInsets.only(
              top: keyboard > 0.0
                  ? (loginWidget
                      ? (!swap
                          ? constraint.maxHeight * 0.2
                          : constraint.maxHeight * 0.1)
                      : (!swap
                          ? constraint.maxHeight * 0.1
                          : constraint.maxHeight * 0.2))
                  : loginWidget
                      ? (!swap
                          ? constraint.maxHeight * 0.23
                          : constraint.maxHeight * 0.15)
                      : (!swap
                          ? constraint.maxHeight * 0.15
                          : constraint.maxHeight * 0.23),
            ),
            InkWell(
                splashColor: Colors.transparent,
                onTap: f,
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    padding: EdgeInsets.symmetric(
                        vertical: constraints.maxHeight * 0.05,
                        horizontal: constraints.maxWidth * 0.1),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: children,
                    ),
                  ),
                )),
          ));

  loginWidget(BoxConstraints constraint) => cardAnimated(
      f: swap
          ? animate
              ? null
              : () => setState(() {
                    animate = true;
                    loginClick = true;
                  })
          : null,
      constraint: constraint,
      loginWidget: true,
      children: [title(!swap, 'Login'), loginInfo()]);
  registerWidget(BoxConstraints constraint) => cardAnimated(
      f: !swap
          ? animate
              ? null
              : () => setState(() {
                    registerClick = true;
                    animate = true;
                  })
          : null,
      children: [
        title(swap, 'Cadastro'),
        registerInfo(),
      ],
      constraint: constraint,
      loginWidget: false);
  loginInfo() => Visibility(
        visible: !swap,
        child: Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) => Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Column(
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
                      controller: password,
                      constraints: constraints,
                      title: 'Senha'),
                  RaisedButton(
                      onPressed: () {
                        c.changeUser(UserModel(
                            email: email.text, password: password.text));
                        c.logIn(context);
                      },
                      child: Text(
                        'Entrar',
                        style: Theme.of(context).primaryTextTheme.button,
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    FlatButton(
                      onPressed: () => c.changeRemember(!c.remember),
                      child: Row(
                        children: [
                          Observer(
                            builder: (_) => Icon(
                              c.remember
                                  ? Icons.check_box
                                  : Icons.check_box_outline_blank,
                            ),
                          ),
                          Text('Lembrar meus dados')
                        ],
                      ),
                    )
                  ]),
                  InkWell(
                    child: Text('Precisa de ajuda?'),
                    onTap: () => c.changeForgetScreen(true),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
  title(bool v, String title) => Container(
          child: Text(
        title,
        style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w700,
            color: Theme.of(context).primaryColor.withOpacity(v ? 1.0 : 0.2)),
      ));
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

  registerInfo() => Visibility(
        visible: swap,
        child: Expanded(
          child: LayoutBuilder(
            builder: (context, constraint) => Container(
              width: constraint.maxWidth,
              height: constraint.maxHeight,
              child: Column(
                children: [
                  Divider(),
                  steps(constraint),
                  Expanded(
                    child: actualStep(),
                  )
                ],
              ),
            ),
          ),
        ),
      );
  actualStep() => Observer(builder: (_) => c.step == 0 ? step0() : step1());
  step0() => LayoutBuilder(
        builder: (context, constraint) => Column(
          children: [
            textField(
                controller: email, title: 'E-mail', constraints: constraint),
            textField(
                controller: password, title: 'Senha', constraints: constraint),
            textField(
                controller: repeatPassword,
                title: 'Confirmar senha',
                constraints: constraint),
            RaisedButton(
              color: yellow,
              onPressed: () => c.changeStep(1),
              child: Text('Confirmar',
                  style: Theme.of(context).primaryTextTheme.button),
            )
          ],
        ),
      );
  step1() => LayoutBuilder(
        builder: (context, constraint) => Column(
          children: [
            Text('Criar PIN de acesso rápido'),
            PinField(
              fields: 4,
              fieldWidth: constraint.maxWidth * 0.2,
            ),
            Text('Uma senha de 4 digitos numéricos.'),
            Text('Seu PIN servirá confirmar ações futuras mais rapidamente.'),
            RaisedButton(
              onPressed: () => null,
              child: Text('Confirmar'),
              color: yellow,
            ),
            InkWell(
                child: Text(
              'Não quero criar agora!',
              style: TextStyle(),
            ))
          ],
        ),
      );
  step2() => LayoutBuilder(
      builder: (context, constraints) =>
          Column(children: [Text('Tudo pronto!'), Icon(Icons.check_circle)]));
  steps(BoxConstraints constraint) => Container(
        height: constraint.maxHeight * 0.1,
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: constraint.maxHeight * 0.0075),
                    child: LayoutBuilder(
                      builder: (context, constraints) => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Observer(
                            builder: (_) => lineStep(
                              c.step >= 0,
                              constraints,
                              0,
                            ),
                          ),
                          Observer(
                            builder: (_) =>
                                lineStep(c.step >= 1, constraints, 1),
                          ),
                          Observer(
                            builder: (_) =>
                                lineStep(c.step >= 1, constraints, 2),
                          ),
                          Observer(
                            builder: (_) =>
                                lineStep(c.step >= 2, constraints, 3),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: constraint.maxWidth * 0.45,
                  child: LayoutBuilder(
                    builder: (context, constraints) => Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Observer(
                          builder: (_) => circleStep(
                            c.step >= 0,
                            constraints,
                          ),
                        ),
                        Observer(
                          builder: (_) => circleStep(c.step >= 1, constraints),
                        ),
                        Observer(
                          builder: (_) => circleStep(c.step >= 2, constraints),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  lineStep(bool v, BoxConstraints constraint, int step) => AnimatedContainer(
        duration: Duration(milliseconds: 100 * (step + 1)),
        height: constraint.maxHeight * 0.1,
        width: constraint.maxWidth * 0.1,
        decoration: BoxDecoration(
          border: !v
              ? Border.symmetric(
                  horizontal: BorderSide(
                      width: 1, color: Theme.of(context).backgroundColor))
              : null,
          color: v ? Theme.of(context).backgroundColor : Colors.white,
        ),
      );
  circleStep(bool v, BoxConstraints constraint) => Container(
      height: constraint.maxWidth * 0.1,
      width: constraint.maxWidth * 0.1,
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).backgroundColor),
          borderRadius: BorderRadius.all(Radius.circular(100)),
          color: v ? Theme.of(context).backgroundColor : Colors.white));
  forgetSteps() => c.step == 0
      ? Container(
          child: Column(children: [
          Text('Problemas de acesso?'),
          Divider(),
          Text('Selecione uma opção'),
          Column(
            children: [
              RaisedButton(
                child: Text('Esqueci minha senha!'),
                onPressed: () => null,
              ),
              RaisedButton(
                child: Text('Esqueci meu E-mail de acesso!!'),
                onPressed: () => null,
              ),
              RaisedButton(
                child: Text('Resgatar PIN!'),
                onPressed: () => null,
              ),
              RaisedButton(
                child: Text('Mudei meu número de celular!'),
                onPressed: () => null,
              ),
              /* RaisedButton(
                child: Text('Outro!'),
                onPressed: () => null,
              ), */
            ],
          )
        ]))
      : Container();
}
