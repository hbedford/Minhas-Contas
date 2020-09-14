// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cardtype_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CardTypeModel on _CardTypeModelBase, Store {
  Computed<bool> _$isCreditComputed;

  @override
  bool get isCredit =>
      (_$isCreditComputed ??= Computed<bool>(() => super.isCredit,
              name: '_CardTypeModelBase.isCredit'))
          .value;
  Computed<bool> _$isDebitComputed;

  @override
  bool get isDebit => (_$isDebitComputed ??= Computed<bool>(() => super.isDebit,
          name: '_CardTypeModelBase.isDebit'))
      .value;
  Computed<bool> _$isCreditAndDebitComputed;

  @override
  bool get isCreditAndDebit => (_$isCreditAndDebitComputed ??= Computed<bool>(
          () => super.isCreditAndDebit,
          name: '_CardTypeModelBase.isCreditAndDebit'))
      .value;

  final _$creditAtom = Atom(name: '_CardTypeModelBase.credit');

  @override
  bool get credit {
    _$creditAtom.reportRead();
    return super.credit;
  }

  @override
  set credit(bool value) {
    _$creditAtom.reportWrite(value, super.credit, () {
      super.credit = value;
    });
  }

  final _$debitAtom = Atom(name: '_CardTypeModelBase.debit');

  @override
  bool get debit {
    _$debitAtom.reportRead();
    return super.debit;
  }

  @override
  set debit(bool value) {
    _$debitAtom.reportWrite(value, super.debit, () {
      super.debit = value;
    });
  }

  final _$_CardTypeModelBaseActionController =
      ActionController(name: '_CardTypeModelBase');

  @override
  dynamic changeToCredit() {
    final _$actionInfo = _$_CardTypeModelBaseActionController.startAction(
        name: '_CardTypeModelBase.changeToCredit');
    try {
      return super.changeToCredit();
    } finally {
      _$_CardTypeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeToDebit() {
    final _$actionInfo = _$_CardTypeModelBaseActionController.startAction(
        name: '_CardTypeModelBase.changeToDebit');
    try {
      return super.changeToDebit();
    } finally {
      _$_CardTypeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeToDebitAndCredit() {
    final _$actionInfo = _$_CardTypeModelBaseActionController.startAction(
        name: '_CardTypeModelBase.changeToDebitAndCredit');
    try {
      return super.changeToDebitAndCredit();
    } finally {
      _$_CardTypeModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
credit: ${credit},
debit: ${debit},
isCredit: ${isCredit},
isDebit: ${isDebit},
isCreditAndDebit: ${isCreditAndDebit}
    ''';
  }
}
