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
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// This widget will inherit the [CountController]
            CountDisplay(),
            ElevatedButton(
              onPressed: () => FastNav.push(
                Counter()

                  /// Navigation creates a new dependency context
                  /// This call will inherit all dependencies from this widget
                  /// If in a child widget that is not [Injectable], pass the current [BuildContext] instead
                  /// In this case, the [CountController]
                  ..inheritDependencies(injectable: this),
              ),
              child: const Text('Push'),
            ),
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

/// A child widget to show that dependencies are inherited
class CountDisplay extends FastWidget {
  /// The inherited [CountController]
  late final controller = get<CountController>();

  CountDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return FastBuilder(() => Text('${controller.count}'));
  }
}
