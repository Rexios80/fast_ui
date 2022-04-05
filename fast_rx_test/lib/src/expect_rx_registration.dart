// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'package:fast_rx/src/rx/rx.dart';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:fast_rx_test/src/fast_rx_testing.mocks.dart';
import 'package:mockito/mockito.dart';

/// Expect that every test in [shouldRegister] registers exactly once, and that
/// every test in [shouldNotRegister] does not register
expectRxRegistration<T extends Rx>({
  required List<RxTest<T>> shouldRegister,
  List<RxTest<T>> shouldNotRegister = const [],
}) {
  final notifier = MockRxNotifier();
  RxNotifier.instance = notifier;

  for (final test in shouldRegister) {
    test.transform(test.rx);
  }

  verify(notifier.addStream(any)).called(shouldRegister.length);

  for (final test in shouldNotRegister) {
    test.transform(test.rx);
  }

  verifyNoMoreInteractions(notifier);
}
