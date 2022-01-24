import 'package:fast_rx/src/rx/rx.dart';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:fast_rx/testing/expect_rx.mocks.dart';

/// Shim for generating [MockRxNotifier.setupObserver]
T? setupObserverShim<T>(RxObserver? observer, ValueGetter<T>? builder) {
  return null;
}

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<RxNotifier>(
      fallbackGenerators: {#setupObserver: setupObserverShim},
    )
  ],
)
/// Expect that every call in [shouldRegister] registers exactly once
expectRx(
  Rx rx, {
  required List<void Function()> shouldRegister,
}) {
  final notifier = MockRxNotifier();
  RxNotifier.instance = notifier;

  for (final call in shouldRegister) {
    call();
  }

  verify(notifier.addStream(rx.stream)).called(shouldRegister.length);
}
