// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserController on _UserControllerBase, Store {
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

  final _$logInAsyncAction = AsyncAction('_UserControllerBase.logIn');

  @override
  Future logIn(String email, String password, BuildContext context) {
    return _$logInAsyncAction.run(() => super.logIn(email, password, context));
  }

  final _$registerAsyncAction = AsyncAction('_UserControllerBase.register');

  @override
  Future register(String email, String name, String password,
      String repeatPassword, BuildContext context) {
    return _$registerAsyncAction.run(
        () => super.register(email, name, password, repeatPassword, context));
  }

  final _$_UserControllerBaseActionController =
      ActionController(name: '_UserControllerBase');

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
  String toString() {
    return '''
user: ${user},
widget: ${widget}
    ''';
  }
}
