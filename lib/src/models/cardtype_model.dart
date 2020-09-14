import 'package:mobx/mobx.dart';
part 'cardtype_model.g.dart';

class CardTypeModel = _CardTypeModelBase with _$CardTypeModel;

abstract class _CardTypeModelBase with Store {
  @observable
  bool credit = false;
  @observable
  bool debit = false;
  _CardTypeModelBase({this.credit, this.debit});
  @computed
  bool get isCredit => credit;
  @computed
  bool get isDebit => debit;
  @computed
  bool get isCreditAndDebit => debit && credit;
  @action
  changeToCredit() {
    credit = true;
    debit = false;
  }

  @action
  changeToDebit() {
    credit = false;
    debit = true;
  }

  @action
  changeToDebitAndCredit() {
    credit = true;
    debit = true;
  }
}
