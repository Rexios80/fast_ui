// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'package:fast_rx/src/rx/rx.dart';
import 'package:test/test.dart';

/// Expect that every call in [shouldNotify] notifies exactly once, and that
/// every call in [shouldNotNotify] does not notify
expectRxNotification(
  Rx rx, {
  required List<void Function()> shouldNotify,
  List<void Function()> shouldNotNotify = const [],
}) {
  rx.stream.listen(
    expectAsync1((value) {}, count: shouldNotify.length),
  );

  for (final call in (shouldNotify + shouldNotNotify)) {
    call();
  }
}
