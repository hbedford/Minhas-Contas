import 'package:minhasconta/src/models/payment_model.dart';
import 'package:minhasconta/src/models/payment_type_model.dart';
import 'package:mobx/mobx.dart';
part 'payments_controller.g.dart';

class PaymentsController = _PaymentsControllerBase with _$PaymentsController;

abstract class _PaymentsControllerBase with Store {
  @observable
  List<PaymentTypeModel> types;
  @observable
  PaymentTypeModel type;
  @observable
  ObservableList payments = [].asObservable();
  _PaymentsControllerBase({this.payments, this.types});
  @action
  addPayment(PaymentModel p) => payments.add(p);
}
