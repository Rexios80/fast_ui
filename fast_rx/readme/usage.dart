import 'package:fast_rx/fast_rx.dart';

void example() {
  // ...

  final count = 0.rx;

  // All primitive methods are available on their reactive versions
  // NOTE: The type checker cannot automatically infer the return type of all
  // methods
  count + 2; // This return a num
  count.value + 2; // This returns an int

  // ...

  // ignore: avoid_print
  count.stream.listen(print);

  // ...

  // Will print the value
  count.value = 1;

  final list = <int>[].rx;
  // Will only notify after the run block completes
  list.run(() {
    list.add(1);
    list.add(2);
  });
}
