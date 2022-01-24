import 'package:fast_rx/src/rx_notifier.dart';
import 'package:fast_rx/fast_rx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:fast_rx/testing/expect_rx.mocks.dart';

void main() {
  test('RxNotifier should add stream', () {
    final notifier = MockRxNotifier();
    RxNotifier.instance = notifier;

    final observer = RxObserver();
    final rx = ''.rx;
    builder() => Text(rx.value);

    when(notifier.setupObserver(any, any)).thenReturn(builder());
    RxNotifier.instance.setupObserver(observer, builder);
    verify(notifier.addStream(rx.stream)).called(1);
  });

  test('RxNotifier should throw', () {
    // Make sure that the RxNotifier instance is not a mock
    RxNotifier.instance = RxNotifier();

    final observer = RxObserver();
    builder() => const Text('');

    expect(
      () => RxNotifier.instance.setupObserver(observer, builder),
      throwsException,
    );
  });
}
