import 'package:flutter_testing/chuck_norris_facts/application/chuck_norris_service.dart';
import 'package:flutter_testing/utils/utils.dart';
import 'package:test/test.dart';

void main() {
  group(
    'Probando ChuckNorrisService :',
    () {
      late ChuckNorrisService service;
      setUp(() => service = ChuckNorrisService.instance);

      test(
        'Deberia devolver true al buscar la categoria sport',
        () async {
          final response = await service.getCategories();

          final List<String> categories =
              parseStringArrayToListString(response.body);

          expect(categories.any((element) => element.contains('sport')), true);
        },
      );
    },
  );
}
