import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Rx registration', () {
    expectRxRegistration(
      shouldRegister: [
        RxTest(''.rx, (rx) => rx == ''),
        RxTest(''.rx, (rx) => rx.hashCode),
        RxTest(''.rx, (rx) => rx.toString()),
        RxTest(''.rx, (rx) => rx.runtimeType),
      ],
    );
  });
}
