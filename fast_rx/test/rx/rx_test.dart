import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Rx notifications', () {
    expectRxNotification(
      shouldNotify: <RxTest<Rx<String>>>[
        RxTest(() => ''.rx, (rx) => rx.value = 'a'),
      ],
      shouldNotNotify: <RxTest<Rx<String>>>[
        RxTest(() => ''.rx, (rx) => rx.run(() => rx.value = 'a')),
      ],
    );

    expectRxRegistration(
      shouldRegister: <RxTest<Rx<String>>>[
        RxTest(() => ''.rx, (rx) => rx.value),
      ],
      shouldNotRegister: <RxTest<Rx<String>>>[
        RxTest(() => ''.rx, (rx) => rx.run(() => rx.value)),
      ],
    );
  });

  test('Rx registration', () {
    expectRxRegistration(
      shouldRegister: [
        RxTest(() => ''.rx, (rx) => rx == ''),
        RxTest(() => ''.rx, (rx) => rx.hashCode),
        RxTest(() => ''.rx, (rx) => rx.toString()),
        RxTest(() => ''.rx, (rx) => rx.runtimeType),
      ],
    );
  });

  test('Rx.run async exception', () {
    expect(
      () => ''.rx.run(() async {}),
      throwsA(isA<RxRunActionWasAsync>()),
    );
  });
}
