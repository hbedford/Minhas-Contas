import 'package:minhasconta/src/db/database.dart';
import 'package:mobx/mobx.dart';
part 'user_controller.g.dart';

class UserController = _UserControllerBase with _$UserController;

abstract class _UserControllerBase with Store {
  @observable
  String email;
  @observable
  String password;
  @observable
  int widget = 0;
  _UserControllerBase({this.email, this.password});
  @action
  logIn(String email, String password) async {
    final db = DatabaseHelper.instance;
    if (email != null && email.contains('@') && password != null) {
      Map map = (await db.getUserWithEmailAndPassword(email, password)).first;
      print(map.toString());
    }
  }

  @action
  changeWidget(int i) => widget = i;
}
