import 'package:minhasconta/src/utils/converting_util.dart';
import 'package:mobx/mobx.dart';
part 'paymentsofday_model.g.dart';

class PaymentsOfDayModel = _PaymentsOfDayModelBase with _$PaymentsOfDayModel;

abstract class _PaymentsOfDayModelBase with Store {
  @observable
  DateTime date;
  @observable
  ObservableList payments = [].asObservable();
  _PaymentsOfDayModelBase({this.date, this.payments});
  @computed
  String get dateToString => Converting().dateToString(date);
}
