// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserModel on _UserModelBase, Store {
  Computed<bool> _$emailIsValidComputed;

  @override
  bool get emailIsValid =>
      (_$emailIsValidComputed ??= Computed<bool>(() => super.emailIsValid,
              name: '_UserModelBase.emailIsValid'))
          .value;
  Computed<bool> _$passwordIsValidComputed;

  @override
  bool get passwordIsValid =>
      (_$passwordIsValidComputed ??= Computed<bool>(() => super.passwordIsValid,
              name: '_UserModelBase.passwordIsValid'))
          .value;
  Computed<bool> _$repeatPasswordIsValidComputed;

  @override
  bool get repeatPasswordIsValid => (_$repeatPasswordIsValidComputed ??=
          Computed<bool>(() => super.repeatPasswordIsValid,
              name: '_UserModelBase.repeatPasswordIsValid'))
      .value;
  Computed<Map<String, dynamic>> _$registerToMapComputed;

  @override
  Map<String, dynamic> get registerToMap => (_$registerToMapComputed ??=
          Computed<Map<String, dynamic>>(() => super.registerToMap,
              name: '_UserModelBase.registerToMap'))
      .value;

  final _$idAtom = Atom(name: '_UserModelBase.id');

  @override
  int get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$nameAtom = Atom(name: '_UserModelBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserModelBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_UserModelBase.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$repeatPasswordAtom = Atom(name: '_UserModelBase.repeatPassword');

  @override
  String get repeatPassword {
    _$repeatPasswordAtom.reportRead();
    return super.repeatPassword;
  }

  @override
  set repeatPassword(String value) {
    _$repeatPasswordAtom.reportWrite(value, super.repeatPassword, () {
      super.repeatPassword = value;
    });
  }

  final _$_UserModelBaseActionController =
      ActionController(name: '_UserModelBase');

  @override
  dynamic changeId(int i) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction(
        name: '_UserModelBase.changeId');
    try {
      return super.changeId(i);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String n) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction(
        name: '_UserModelBase.changeName');
    try {
      return super.changeName(n);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeEmail(String e) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction(
        name: '_UserModelBase.changeEmail');
    try {
      return super.changeEmail(e);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String p) {
    final _$actionInfo = _$_UserModelBaseActionController.startAction(
        name: '_UserModelBase.changePassword');
    try {
      return super.changePassword(p);
    } finally {
      _$_UserModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
email: ${email},
password: ${password},
repeatPassword: ${repeatPassword},
emailIsValid: ${emailIsValid},
passwordIsValid: ${passwordIsValid},
repeatPasswordIsValid: ${repeatPasswordIsValid},
registerToMap: ${registerToMap}
    ''';
  }
}
