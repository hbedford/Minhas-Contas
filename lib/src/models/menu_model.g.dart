// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MenuModel on _MenuModelBase, Store {
  final _$nameAtom = Atom(name: '_MenuModelBase.name');

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

  final _$iconAtom = Atom(name: '_MenuModelBase.icon');

  @override
  Icon get icon {
    _$iconAtom.reportRead();
    return super.icon;
  }

  @override
  set icon(Icon value) {
    _$iconAtom.reportWrite(value, super.icon, () {
      super.icon = value;
    });
  }

  final _$widgetAtom = Atom(name: '_MenuModelBase.widget');

  @override
  Widget get widget {
    _$widgetAtom.reportRead();
    return super.widget;
  }

  @override
  set widget(Widget value) {
    _$widgetAtom.reportWrite(value, super.widget, () {
      super.widget = value;
    });
  }

  final _$_MenuModelBaseActionController =
      ActionController(name: '_MenuModelBase');

  @override
  dynamic cW(Widget w) {
    final _$actionInfo =
        _$_MenuModelBaseActionController.startAction(name: '_MenuModelBase.cW');
    try {
      return super.cW(w);
    } finally {
      _$_MenuModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
icon: ${icon},
widget: ${widget}
    ''';
  }
}
