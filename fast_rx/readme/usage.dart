import 'package:fast_rx/fast_rx.dart';

void example() {
  // ...

  final count = 0.rx;

  // All primitive methods are available on their reactive versions
  final asdf = count + 2;

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
