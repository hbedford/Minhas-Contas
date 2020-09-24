import 'package:flutter/cupertino.dart';
import 'package:minhasconta/src/db/database.dart';
import 'package:minhasconta/src/models/category_model.dart';
import 'package:minhasconta/src/models/subcategory_model.dart';
import 'package:mobx/mobx.dart';
part 'category_controller.g.dart';

class CategoryController = _CategoryControllerBase with _$CategoryController;

abstract class _CategoryControllerBase with Store {
  @observable
  CategoryModel category;
  @observable
  SubCategoryModel subCategory;
  @observable
  ObservableList categories = [].asObservable();
  @observable
  int step;
  _CategoryControllerBase({this.categories, this.category});
  @action
  addCategory(CategoryModel c) => categories.add(c);

  @action
  removeCategory(CategoryModel c) => categories.remove(c);
  @action
  changeCategory(CategoryModel c) => category = c;
  @action
  changeSubCategory(SubCategoryModel c) => subCategory = c;
  @action
  saveCategory(String name, BuildContext context) async {
    category.changeName(name);
    final db = DatabaseHelper.instance;
    await db.registerCategory(category);
    changeCategory(null);
    changeStep(null);
    getCategories();
    Navigator.pop(context);
  }

  @action
  changeStep(int v) => step = v;
  @action
  getCategories() async {
    final d = DatabaseHelper.instance;
    categories = ObservableList.of(await d.getCategories());
  }

  @action
  selectTypeStep(bool v) {
    step = 1;
    if (v)
      changeCategory(CategoryModel());
    else
      changeSubCategory(SubCategoryModel());
  }

  @action
  cancelCategory(BuildContext context) {
    Navigator.pop(context);
  }

  @computed
  bool get type => category != null && subCategory == null;
}
