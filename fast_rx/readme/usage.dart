import 'package:fast_rx/fast_rx.dart';
import 'package:flutter/material.dart';

void example() {
  // ...

  final count = 0.rx;

  // ...

  count.stream.listen((value) {
    // Do something
  });

  // ...

  FastBuilder(() => Text('$count'));
  FastBuilder(
    () => Text('$count'),
    condition: () => true,
  );

  // ...

  // Will print the value and trigger a rebuild of FastBuilders
  count.value = 1;
}
