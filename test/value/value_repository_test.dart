import 'dart:convert';
import 'package:flutter_testing/value/data/value_repository.dart';
import 'package:flutter_testing/value/application/value_service.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

class MockValueService extends Mock implements ValueService {}

void main() {
  group(
    'Probando conexion de Value Repository con Value Service : ',
    () {
      late ValueRepository repository;
      setUp(() => repository = ValueRepository(service: ValueService.instance));

      test(
        'Deberia devolver 10',
        () async {
          expect(await repository.getValueFromService(), 10);
        },
      );
    },
  );

  group(
    'Probando Value Repository usando Mocktail :',
    () {
      late MockValueService mockService;
      late ValueRepository repository;

      setUp(() {
        mockService = MockValueService();
        repository = ValueRepository(service: mockService);
      });

      tearDown(() {
        resetMocktailState();
      });

      test(
        'Deberia devolver 10',
        () async {
          when(() => mockService.getValue()).thenAnswer(
            (_) async => await Future.value(
              http.Response(jsonEncode({'value': 10}), 200),
            ),
          );

          expect(await repository.getValueFromService(), 10);
        },
      );

      test(
        'Deberia lanzar una excepcion',
        () async {
          when(() => mockService.getValue()).thenAnswer(
            (_) async => await Future.value(
              http.Response('Error in MockServer', 500),
            ),
          );

          expect(() async => await repository.getValueFromService(),
              throwsA(isA<Exception>()));
        },
      );

      test(
        'Value deberia ser 33',
        () async {
          when(() => mockService.getCodeValue(code: '123')).thenAnswer(
            (_) async => await Future.value(
              http.Response(jsonEncode({'value': 33}), 200),
            ),
          );

          expect(await repository.getCodeValue(code: '123'), 33);
        },
      );

      test(
        'Deberia devolver una excepcion',
        () async {
          when(() => mockService.getCodeValue(code: '321')).thenAnswer(
            (_) async => await Future.value(
              http.Response('Wrong code!', 201),
            ),
          );

          expect(() async => await repository.getCodeValue(code: '321'),
              throwsA(isA<Exception>()));
        },
      );
    },
  );
}
