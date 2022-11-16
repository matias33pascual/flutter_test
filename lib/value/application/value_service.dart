//* Value Service: clase Singleton que simula un servicio online que devuelve un valor de internet
import 'dart:convert';
import 'package:http/http.dart' as http;

class ValueService {
  static final ValueService _instance = ValueService._();
  static ValueService get instance => _instance;

  ValueService._();

  Future<http.Response> getValue() async {
    return http.Response(jsonEncode({'value': 10}), 200);
  }

  Future<http.Response> getCodeValue({required String code}) async {
    return http.Response(jsonEncode({'value': 33}), 200);
  }
}
