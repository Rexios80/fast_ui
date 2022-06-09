import 'package:fast_rx_persistence/fast_rx_persistence.dart';
import 'package:fast_ui/fast_ui.dart';
import 'package:flutter/material.dart';

class FastRxPersistenceExample extends StatelessWidget {
  final intPref = 0.rx..persist('int');
  final doublePref = 0.0.rx..persist('double');
  final boolPref = false.rx..persist('bool');
  final stringPref = ''.rx..persist('string');
  final stringListPref = <String>[].rx..persist('stringList');
  final transformedPref = <int>[].rx..persist<List<String>>(
    'transformed',
    decode: (value) => value.map(int.parse).toList(),
    encode: (value) => value.map((e) => e.toString()).toList(),
  );

  FastRxPersistenceExample({Key? key}) : super(key: key);

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
            const Text('Reactive int preference:'),
            FastBuilder(
              () => Text(
                '$intPref',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive double preference:'),
            FastBuilder(
              () => Text(
                '$doublePref',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive bool preference:'),
            FastBuilder(
              () => Text(
                '$boolPref',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive string preference:'),
            FastBuilder(
              () => Text(
                '$stringPref',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive string list preference:'),
            FastBuilder(
              () => Text(
                '$stringListPref',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const SizedBox(height: 16),
            const Text('Reactive transformed preference:'),
            FastBuilder(
              () => Text(
                '$transformedPref',
                style: Theme.of(context).textTheme.headline4,
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
