import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testando', () {
    String v = '0123456789123456';
    print(v.substring(0, 4) +
        ' ' +
        v.substring(4, 8) +
        ' ' +
        v.substring(8, 12) +
        ' ' +
        v.substring(12, 16));
  });
}
