import 'dart:convert';
import 'package:http/http.dart' as http;

class ValueService {
  ValueService._();

  static final ValueService _instance = ValueService._();
  static ValueService get instance => _instance;

  Future<http.Response> getValue() async {
    return http.Response(jsonEncode({'value': 10}), 200);
  }

  Future<http.Response> getCodeValue({required String code}) async {
    return http.Response(jsonEncode({'value': 33}), 200);
  }
}
