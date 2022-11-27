import 'package:flutter_testing/chuck_norris_facts/application/chuck_norris_service.dart';
import 'package:flutter_testing/chuck_norris_facts/data/chuck_norris_repository.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

class MockChuckNorrisService extends Mock implements ChuckNorrisService {}

void main() {
  group(
    'Probando Chuck Norris Repository :',
    () {
      late ChuckNorrisRepository repository;

      setUp(() => repository =
          ChuckNorrisRepository(service: ChuckNorrisService.instance));

      test(
        'Deberia devolver un List<String> con elementos',
        () async {
          final categories = await repository.getCategories();

          expect(categories.isNotEmpty, isTrue);
        },
      );
      test(
        'Deberia devolver true al buscar la categoria food ',
        () async {
          final categories = await repository.getCategories();

          expect(categories.any((element) => element.contains('food')), isTrue);
        },
      );

      test(
        'Deberia traer un hecho de Chuck Norris',
        () async {
          final joke = await repository.getJoke();

          expect(joke, isNotNull);
          expect(joke.value.runtimeType, String);
        },
      );

      test(
        'Deberia traer un hecho de Chuck Norris de una categoria',
        () async {
          final categories = await repository.getCategories();

          final joke = await repository.getJokeFromCategory(categories[0]);

          expect(joke, isNotNull);
          expect(joke.value.runtimeType, String);
        },
      );
    },
  );

  group(
    'Simulando error en el servicio Chuck Norris Service:',
    () {
      test(
        "Deberia devolver un array vacio al traer las categorias",
        () async {
          final mockService = MockChuckNorrisService();
          final repository = ChuckNorrisRepository(service: mockService);

          when(() => mockService.getCategories())
              .thenThrow(Exception("error in service"));

          final categories = await repository.getCategories();

          expect(categories.isEmpty, isTrue);
        },
      );
    },
  );
}
