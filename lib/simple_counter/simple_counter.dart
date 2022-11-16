//* Simple counter: tiene un valor y funciones que modifican ese valor

class SimpleCounter {
  int value = 0;

  SimpleCounter();

  void increment() => value++;
  void decrement() => value--;

  int incrementeQuantity(int quantity) => value += quantity;
  int decrementQuantity(int quantity) => value -= quantity;
}
