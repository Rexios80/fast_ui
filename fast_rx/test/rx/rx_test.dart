import 'package:fast_rx/src/rx/rx_value.dart';
import 'package:fast_rx/testing.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Rx registration', () {
    final rx = ''.rx;
    expectRxRegistration(
      rx,
      shouldRegister: [
        // ignore: unrelated_type_equality_checks
        () => rx == '',
        () => rx.hashCode,
        () => rx.toString(),
        () => rx.runtimeType,
      ],
    );

    // ignore: unrelated_type_equality_checks
    expect(rx == rx.value, true);
  });
}
