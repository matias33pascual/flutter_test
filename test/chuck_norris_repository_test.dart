import 'package:flutter_testing/chuck_norris_facts/application/chuck_norris_service.dart';
import 'package:flutter_testing/chuck_norris_facts/data/chuck_norris_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockChuckNorrisService extends Mock implements ChuckNorrisService {}

void main() {
  group(
    'Probando conexion con el servicio :',
    () {
      late ChuckNorrisRepository repository;

      setUp(() => repository =
          ChuckNorrisRepository(service: ChuckNorrisService.instance));

      test(
        'Deberia devolver un List<String> con elementos',
        () async {
          final categories = await repository.getCategories();

          expect(categories.isNotEmpty, true);
        },
      );
      test(
        'Deberia devolver true al buscar la categoria food ',
        () async {
          final categories = await repository.getCategories();

          expect(categories.any((element) => element.contains('food')), true);
        },
      );
    },
  );

  group(
    'Simulando error en el servicio :',
    () {
      test(
        "Deberia devolver un array vacio",
        () async {
          final mockService = MockChuckNorrisService();
          final repository = ChuckNorrisRepository(service: mockService);

          when(() => mockService.getCategories())
              .thenThrow(Exception("error in service"));

          final categories = await repository.getCategories();

          expect(categories.isEmpty, true);
        },
      );
    },
  );
}
