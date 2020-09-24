// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SubCategoryModel on _SubCategoryModelBase, Store {
  final _$nameAtom = Atom(name: '_SubCategoryModelBase.name');

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

  final _$colorAtom = Atom(name: '_SubCategoryModelBase.color');

  @override
  Color get color {
    _$colorAtom.reportRead();
    return super.color;
  }

  @override
  set color(Color value) {
    _$colorAtom.reportWrite(value, super.color, () {
      super.color = value;
    });
  }

  final _$_SubCategoryModelBaseActionController =
      ActionController(name: '_SubCategoryModelBase');

  @override
  dynamic changeName(String n) {
    final _$actionInfo = _$_SubCategoryModelBaseActionController.startAction(
        name: '_SubCategoryModelBase.changeName');
    try {
      return super.changeName(n);
    } finally {
      _$_SubCategoryModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeColor(Color c) {
    final _$actionInfo = _$_SubCategoryModelBaseActionController.startAction(
        name: '_SubCategoryModelBase.changeColor');
    try {
      return super.changeColor(c);
    } finally {
      _$_SubCategoryModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
color: ${color}
    ''';
  }
}
