import 'package:mobx/mobx.dart';
part 'payment_type_model.g.dart';

class PaymentTypeModel = _PaymentTypeModelBase with _$PaymentTypeModel;

abstract class _PaymentTypeModelBase with Store {
  @observable
  int id;
  @observable
  String name;
  @observable
  bool active;
  _PaymentTypeModelBase({this.id, this.name, this.active = false});
}
