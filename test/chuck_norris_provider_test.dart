import 'package:flutter_testing/chuck_norris_facts/application/chuck_norris_service.dart';
import 'package:flutter_testing/chuck_norris_facts/data/chuck_norris_repository.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Probando ChuckNorrisRepository :',
    () {
      late ChuckNorrisRepository repository;

      setUp(() => repository =
          ChuckNorrisRepository(service: ChuckNorrisService.instance));
      test(
        'Deberia devolver true al buscar la categoria food: ',
        () async {
          final categories = await repository.getCategories();

          expect(categories.any((element) => element.contains('food')), true);
        },
      );
    },
  );
}
