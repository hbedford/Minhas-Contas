import 'package:minhasconta/src/models/payment_model.dart';
import 'package:minhasconta/src/models/payment_type_model.dart';
import 'package:mobx/mobx.dart';
part 'payments_controller.g.dart';

class PaymentsController = _PaymentsControllerBase with _$PaymentsController;

abstract class _PaymentsControllerBase with Store {
  @observable
  ObservableList<PaymentTypeModel> types;
  @observable
  PaymentTypeModel type;
  @observable
  ObservableList payments = [].asObservable();
  _PaymentsControllerBase({this.payments, this.types});
  @action
  addPayment(PaymentModel p) => payments.add(p);
  @action
  changeTypes(List<PaymentTypeModel> l) => types = ObservableList.of(l);
  @action
  PaymentTypeModel getTypeWithId(int i) {
    return types[types.indexWhere((element) => element.id == i)];
  }

  @action
  PaymentTypeModel getTypeWithName(String name) {
    return types[types.indexWhere((element) => element.name == name)];
  }
}
