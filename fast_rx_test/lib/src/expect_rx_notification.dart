// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'dart:async';

import 'package:fast_rx/src/rx/rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

/// Expect that every test in [shouldNotify] notifies exactly once, and that
/// every test in [shouldNotNotify] does not notify
expectRxNotification<T extends Rx>({
  required List<RxTest<T>> shouldNotify,
  List<RxTest<T>> shouldNotNotify = const [],
}) {
  final controller = StreamController<void>();

  controller.stream
      .listen(expectAsync1((value) {}, count: shouldNotify.length));

  for (final test in (shouldNotify + shouldNotNotify)) {
    final rx = test.rx;
    rx.stream.first.then(controller.add);
    test.transform(rx);
  }
}
