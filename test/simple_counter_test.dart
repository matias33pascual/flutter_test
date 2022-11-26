import 'package:flutter_testing/simple_counter/simple_counter.dart';
import 'package:test/expect.dart';
import 'package:test/scaffolding.dart';

void main() {
  group(
    'Probando funcionalidad del contador :',
    () {
      late SimpleCounter counter;
      setUp(() => counter = SimpleCounter());

      test(
        'El contador deberia comenzar en 0',
        () {
          expect(counter.value, 0);
        },
      );

      test(
        'Deberia aumentar el valor del contador',
        () {
          counter.increment();
          expect(counter.value, 1);
        },
      );

      test(
        'Deberia disminuir el valor del contador',
        () {
          counter.increment();
          expect(counter.value, 1);

          counter.decrement();
          expect(counter.value, 0);
        },
      );

      test(
        'Deberia aumentar el valor del contador en 5',
        () {
          counter.incrementeQuantity(5);
          expect(counter.value, 5);
        },
      );

      test(
        'Deberia dismunir el valor del contador en 10',
        () {
          counter.incrementeQuantity(10);
          expect(counter.value, 10);

          counter.decrementQuantity(10);
          expect(counter.value, 0);
        },
      );
    },
  );
}
