import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('testando', () async {
    double percent = 30;
    for (double i = 1; i <= 100; i++) {
      double new_percent = percent + (i / 10);
      print(new_percent);
    }
  });
}
