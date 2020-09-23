// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$actionButtonAtom = Atom(name: '_HomeControllerBase.actionButton');

  @override
  bool get actionButton {
    _$actionButtonAtom.reportRead();
    return super.actionButton;
  }

  @override
  set actionButton(bool value) {
    _$actionButtonAtom.reportWrite(value, super.actionButton, () {
      super.actionButton = value;
    });
  }

  final _$indexAtom = Atom(name: '_HomeControllerBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  dynamic changeAButton(bool v) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeAButton');
    try {
      return super.changeAButton(v);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeIndex(int i) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.changeIndex');
    try {
      return super.changeIndex(i);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
actionButton: ${actionButton},
index: ${index}
    ''';
  }
}
