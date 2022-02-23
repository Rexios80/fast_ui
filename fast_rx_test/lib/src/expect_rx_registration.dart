// ignore_for_file: implementation_imports, invalid_use_of_visible_for_testing_member

import 'package:fast_rx/src/rx/rx.dart';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:mockito/mockito.dart';
import 'package:fast_rx/testing/fast_rx_testing.mocks.dart';

/// Expect that every call in [shouldRegister] registers exactly once, and that
/// every call in [shouldNotRegister] does not register
expectRxRegistration(
  Rx rx, {
  required List<void Function()> shouldRegister,
  List<void Function()> shouldNotRegister = const [],
}) {
  final notifier = MockRxNotifier();
  RxNotifier.instance = notifier;

  for (final call in (shouldRegister + shouldNotRegister)) {
    call();
  }

  verify(notifier.addStream(rx.stream)).called(shouldRegister.length);
}
