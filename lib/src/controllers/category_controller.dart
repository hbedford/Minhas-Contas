import 'package:minhasconta/src/models/category_model.dart';
import 'package:mobx/mobx.dart';
part 'category_controller.g.dart';

class CategoryController = _CategoryControllerBase with _$CategoryController;

abstract class _CategoryControllerBase with Store {
  @observable
  CategoryModel category;
  @observable
  ObservableList categories = [].asObservable();
  _CategoryControllerBase({this.categories, this.category});
  @action
  addCategory(CategoryModel c) => categories.add(c);

  @action
  removeCategory(CategoryModel c) => categories.remove(c);
  @action
  changeCategory(CategoryModel c) => category = c;
}
