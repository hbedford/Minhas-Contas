import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testando', () {
    int t = 10 * 1;
    for (int i = 0; i < 10; i++) {
      t -= 10;
      print(i.toString() + ' ' + t.toString());
    }
  });
}
