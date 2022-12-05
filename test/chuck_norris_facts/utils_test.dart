import 'package:flutter_testing/chuck_norris_facts/utils/utils.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group(
    'Probando parseStringArrayToListString :',
    () {
      test(
        'Deberia encontrar "Playa" en una lista de string',
        () {
          expect(
            parseStringArrayToListString('["Mar","Arena","Playa"]')
                .contains("Playa"),
            isTrue,
          );
        },
      );
    },
  );
}
