// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryController on _CategoryControllerBase, Store {
  Computed<bool> _$typeComputed;

  @override
  bool get type => (_$typeComputed ??= Computed<bool>(() => super.type,
          name: '_CategoryControllerBase.type'))
      .value;

  final _$categoryAtom = Atom(name: '_CategoryControllerBase.category');

  @override
  CategoryModel get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(CategoryModel value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$subCategoryAtom = Atom(name: '_CategoryControllerBase.subCategory');

  @override
  SubCategoryModel get subCategory {
    _$subCategoryAtom.reportRead();
    return super.subCategory;
  }

  @override
  set subCategory(SubCategoryModel value) {
    _$subCategoryAtom.reportWrite(value, super.subCategory, () {
      super.subCategory = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_CategoryControllerBase.categories');

  @override
  ObservableList<dynamic> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<dynamic> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$stepAtom = Atom(name: '_CategoryControllerBase.step');

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

  final _$saveCategoryAsyncAction =
      AsyncAction('_CategoryControllerBase.saveCategory');

  @override
  Future saveCategory(String name, BuildContext context) {
    return _$saveCategoryAsyncAction
        .run(() => super.saveCategory(name, context));
  }

  final _$getCategoriesAsyncAction =
      AsyncAction('_CategoryControllerBase.getCategories');

  @override
  Future getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  final _$_CategoryControllerBaseActionController =
      ActionController(name: '_CategoryControllerBase');

  @override
  dynamic addCategory(CategoryModel c) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.addCategory');
    try {
      return super.addCategory(c);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeCategory(CategoryModel c) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.removeCategory');
    try {
      return super.removeCategory(c);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeCategory(CategoryModel c) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.changeCategory');
    try {
      return super.changeCategory(c);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeSubCategory(SubCategoryModel c) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.changeSubCategory');
    try {
      return super.changeSubCategory(c);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeStep(int v) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.changeStep');
    try {
      return super.changeStep(v);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectTypeStep(bool v) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.selectTypeStep');
    try {
      return super.selectTypeStep(v);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic cancelCategory(BuildContext context) {
    final _$actionInfo = _$_CategoryControllerBaseActionController.startAction(
        name: '_CategoryControllerBase.cancelCategory');
    try {
      return super.cancelCategory(context);
    } finally {
      _$_CategoryControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
category: ${category},
subCategory: ${subCategory},
categories: ${categories},
step: ${step},
type: ${type}
    ''';
  }
}
