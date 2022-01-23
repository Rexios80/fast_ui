import 'package:fast_rx/src/rx/rx_value.dart';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter_test/flutter_test.dart';
import '../rx_notifier_test.mocks.dart';
import 'rx_registration_test_utils.dart';

void main() {
  test('Rx registration', () {
    final notifier = MockRxNotifier();
    RxNotifier.instance = notifier;

    final rx = ''.rx;
    testRegistration(rx, [
      // ignore: unrelated_type_equality_checks
      () => rx == '',
      () => rx.hashCode,
      () => rx.toString(),
      () => rx.runtimeType,
    ]);

    // ignore: unrelated_type_equality_checks
    expect(rx == rx.value, true);
  });
}
