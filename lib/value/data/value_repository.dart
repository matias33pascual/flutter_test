import 'package:flutter_testing/value/application/value_service.dart';
import 'package:flutter_testing/value/domain/value.dart';
import 'package:http/http.dart';

class ValueRepository {
  ValueService service;

  ValueRepository({required this.service});

  Future<int> getValueFromService() async {
    final response = await service.getValue();

    switch (response.statusCode) {
      case 200:
        final Value valueFromServer = Value.fromJson(response.body);
        return valueFromServer.value;

      default:
        throw Exception(
            'Error in getValueFromService(). Code ${response.statusCode}: ${response.body}.');
    }
  }

  Future<int> getCodeValue({required String code}) async {
    final Response response = await service.getCodeValue(code: code);

    switch (response.statusCode) {
      case 200:
        final Value valueFromServer = Value.fromJson(response.body);
        return valueFromServer.value;

      default:
        throw Exception('Error in server: ${response.body}');
    }
  }
}
