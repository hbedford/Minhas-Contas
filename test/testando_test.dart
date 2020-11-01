import 'package:flutter_test/flutter_test.dart';

void main() {
  test('testando', () {
    String v = '012';
    print(v.length >= 4 ? v.substring(0, 4) : '0000');
  });
}
