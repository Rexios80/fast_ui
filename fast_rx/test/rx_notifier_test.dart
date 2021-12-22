import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('RxNotifier', () {
    final observer = RxObserver();
    builder() => const Text('');

    try {
      RxNotifier.setupObserver(observer, builder);
    } catch (e) {
      return;
    }
    throw Exception('Expected exception');
  });
}
