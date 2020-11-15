import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test('testando', () async {
    final response = await http.post(
        "https://www.psiquevida.com.br/etest/sistema/api_emociograma/?funcao=acesso",
        headers: {
          "Accept": "application/json"
        },
        body: {
          "log_user": "yanca",
          "senha": "851248",
          "token":
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJsb2NhbGhvc3QiLCJuYW1lIjoiS2xleWJlciIsImVtYWlsIjoia2xleWJlckB0a2luZm9ybW//lkaWEubmV0In0=.o2RU4lsv0HvYx44//PqxT+8St4zZu9rlrcJA7AO88nA=",
        });
    print(response.body);
  });
}
