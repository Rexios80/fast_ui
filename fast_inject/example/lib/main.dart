import 'package:fast_inject/fast_inject.dart';
import 'package:fast_nav/fast_nav.dart';
import 'package:fast_rx_flutter/fast_rx_flutter.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      navigatorKey: FastNav.init(),
      home: Counter()..inject(CountController()),
    ),
  );
}

class CountController {
  final count = 0.rx;
}

class Counter extends FastWidget {
  late final controller = get<CountController>();

  Counter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FastBuilder(() => Text('${controller.count}')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.count.value++,
        child: const Icon(Icons.add),
      ),
    );
  }
}
