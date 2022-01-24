import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';
import 'package:mockito/annotations.dart';

/// Shim for generating MockRxNotifier.setupObserver
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

/// stub
void stub() {}
