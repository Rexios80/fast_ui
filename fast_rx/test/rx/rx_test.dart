import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  test('Rx registration and notifications', () {
    expectRx(
      shouldRegister: <RxTest<RxValue<String>>>[
        RxTest(() => ''.rx, (rx) => rx.value),
        RxTest(() => ''.rx, (rx) => rx == ''.rx, count: 2),
        RxTest(() => ''.rx, (rx) => rx.hashCode),
        RxTest(() => ''.rx, (rx) => rx.toString()),
      ],
      shouldNotRegister: <RxTest<RxValue<String>>>[
        // ignore: invalid_use_of_protected_member
        RxTest(() => ''.rx, (rx) => rx.run(() => rx.value)),
        RxTest(() => ''.rx, (rx) => rx.runtimeType),
      ],
      shouldNotify: <RxTest<RxValue<String>>>[
        RxTest(() => ''.rx, (rx) => rx.value = 'a'),
      ],
      shouldNotNotify: <RxTest<RxValue<String>>>[
        // ignore: invalid_use_of_protected_member
        RxTest(() => ''.rx, (rx) => rx.run(() => rx.value = 'a')),
      ],
    );
  });

  test('Rx.run async exception', () {
    expect(
      // ignore: invalid_use_of_protected_member
      () => ''.rx.run(() async {}),
      throwsA(isA<RxRunActionWasAsync>()),
    );
  });
}
