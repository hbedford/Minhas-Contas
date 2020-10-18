import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:minhasconta/src/models/card_model.dart';
import 'package:minhasconta/src/utils/compare.dart';

void main() {
  List<CardModel> list = [
    CardModel(color: Colors.green),
    CardModel(color: Colors.blue),
    CardModel(color: Colors.red),
    CardModel(color: Colors.orange),
    null
  ];
  test('Test values', () {
    Compare compare = Compare();
  });
}
