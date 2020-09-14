import 'package:minhasconta/src/utils/converting_util.dart';
import 'package:mobx/mobx.dart';
part 'paymentsofday_model.g.dart';

class PaymentsOfDay = _PaymentsOfDayBase with _$PaymentsOfDay;

abstract class _PaymentsOfDayBase with Store {
  @observable
  DateTime date;
  @observable
  ObservableList payments = [].asObservable();
  _PaymentsOfDayBase({this.date, this.payments});
  @computed
  String get dateToString => Converting().dateToString(date);
}
