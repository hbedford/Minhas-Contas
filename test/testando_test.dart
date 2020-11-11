import 'package:flutter_test/flutter_test.dart';
import 'package:minhasconta/src/models/card_model.dart';

void main() {
  test('testando', () {
    DateTime date;
    date = DateTime.now();
    print(!(date.compareTo(DateTime.now()) == 0));
  });
}
