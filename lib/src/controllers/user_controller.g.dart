// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
  Computed<Future<bool>> _$getUserInfoComputed;

  @override
  Future<bool> get getUserInfo =>
      (_$getUserInfoComputed ??= Computed<Future<bool>>(() => super.getUserInfo,
              name: '_UserControllerBase.getUserInfo'))
          .value;

  final _$userAtom = Atom(name: '_UserControllerBase.user');

  @override
  UserModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(UserModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  final _$rememberAtom = Atom(name: '_UserControllerBase.remember');

  @override
  bool get remember {
    _$rememberAtom.reportRead();
    return super.remember;
  }

  @override
  set remember(bool value) {
    _$rememberAtom.reportWrite(value, super.remember, () {
      super.remember = value;
    });
  }

  final _$widgetAtom = Atom(name: '_UserControllerBase.widget');

  @override
  int get widget {
    _$widgetAtom.reportRead();
    return super.widget;
  }

  @override
  set widget(int value) {
    _$widgetAtom.reportWrite(value, super.widget, () {
      super.widget = value;
    });
  }

  final _$forgetStepsAtom = Atom(name: '_UserControllerBase.forgetSteps');

  @override
  bool get forgetSteps {
    _$forgetStepsAtom.reportRead();
    return super.forgetSteps;
  }

  @override
  set forgetSteps(bool value) {
    _$forgetStepsAtom.reportWrite(value, super.forgetSteps, () {
      super.forgetSteps = value;
    });
  }

  final _$forgetStepAtom = Atom(name: '_UserControllerBase.forgetStep');

  @override
  int get forgetStep {
    _$forgetStepAtom.reportRead();
    return super.forgetStep;
  }

  @override
  set forgetStep(int value) {
    _$forgetStepAtom.reportWrite(value, super.forgetStep, () {
      super.forgetStep = value;
    });
  }

  final _$stepAtom = Atom(name: '_UserControllerBase.step');

  @override
  int get step {
    _$stepAtom.reportRead();
    return super.step;
  }

  @override
  set step(int value) {
    _$stepAtom.reportWrite(value, super.step, () {
      super.step = value;
    });
  }

  final _$startLogInAsyncAction = AsyncAction('_UserControllerBase.startLogIn');

  @override
  Future startLogIn(BuildContext context) {
    return _$startLogInAsyncAction.run(() => super.startLogIn(context));
  }

  final _$logInAsyncAction = AsyncAction('_UserControllerBase.logIn');

  @override
  Future logIn(BuildContext context) {
    return _$logInAsyncAction.run(() => super.logIn(context));
  }

  final _$registerAsyncAction = AsyncAction('_UserControllerBase.register');

  @override
  Future register(String email, String name, String password,
      String repeatPassword, BuildContext context) {
    return _$registerAsyncAction.run(
        () => super.register(email, name, password, repeatPassword, context));
  }

  final _$logOutAsyncAction = AsyncAction('_UserControllerBase.logOut');

  @override
  Future logOut(BuildContext context) {
    return _$logOutAsyncAction.run(() => super.logOut(context));
  }

  final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase');

  @override
  dynamic changeForgetScreen(bool v) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.changeForgetScreen');
    try {
      return super.changeForgetScreen(v);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeForgetStep(int s) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.changeForgetStep');
    try {
      return super.changeForgetStep(s);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeRemember(bool v) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.changeRemember');
    try {
      return super.changeRemember(v);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUser(UserModel u) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.changeUser');
    try {
      return super.changeUser(u);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeWidget(int i) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.changeWidget');
    try {
      return super.changeWidget(i);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeStep(int i) {
    final _$actionInfo = _$_UserControllerBaseActionController.startAction(
        name: '_UserControllerBase.changeStep');
    try {
      return super.changeStep(i);
    } finally {
      _$_UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
remember: ${remember},
widget: ${widget},
forgetSteps: ${forgetSteps},
forgetStep: ${forgetStep},
step: ${step},
getUserInfo: ${getUserInfo}
    ''';
  }
}
