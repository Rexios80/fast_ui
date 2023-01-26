import 'package:fast_ui/fast_ui.dart';
import 'package:flutter/material.dart';

class FastRxPersistenceExample extends StatelessWidget {
  final intPref = 0.rx..persist('int');
  final doublePref = 0.0.rx..persist('double');
  final boolPref = false.rx..persist('bool');
  final stringPref = ''.rx..persist('string');
  final stringListPref = <String>[].rx..persist('stringList');
  final transformedPref = <int>[].rx
    ..persist<List<String>>(
      'transformed',
      converter: InlineConverter(
        fromStore: (value) => value.map(int.parse).toList(),
        toStore: (value) => value.map((e) => e.toString()).toList(),
      ),
    );

  FastRxPersistenceExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fast_rx_persistence Example'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            Text(
              'Reload the page to see the persisted values',
              textAlign: TextAlign.center,
              style: context.textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            const Text('Reactive int preference:'),
            FastBuilder(
              () => Text(
                '$intPref',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive double preference:'),
            FastBuilder(
              () => Text(
                '$doublePref',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive bool preference:'),
            FastBuilder(
              () => Text(
                '$boolPref',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive string preference:'),
            FastBuilder(
              () => Text(
                '$stringPref',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive string list preference:'),
            FastBuilder(
              () => Text(
                '$stringListPref',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive transformed preference:'),
            FastBuilder(
              () => Text(
                '$transformedPref',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void increment() {
    intPref.value++;
    doublePref.value++;
    boolPref.value = !boolPref.value;
    stringPref.value = '$stringPref${intPref.value}';
    stringListPref.add(intPref.value.toString());
    transformedPref.add(intPref.value);
  }
}
