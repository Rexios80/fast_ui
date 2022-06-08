import 'package:fast_rx_prefs/fast_rx_prefs.dart';
import 'package:fast_ui/fast_ui.dart';
import 'package:flutter/material.dart';

class FastRxPrefsExample extends StatelessWidget {
  final intPref = RxPref('int', defaultValue: 0);
  final doublePref = RxPref('double', defaultValue: 0.0);
  final boolPref = RxPref('bool', defaultValue: false);
  final stringPref = RxPref('string', defaultValue: '');
  final stringListPref = RxPref('stringList', defaultValue: []);
  final transformedPref = RxPref<List<int>, List<String>>(
    'transformed',
    defaultValue: [],
    fromPref: (value) => value.map((e) => int.parse(e)).toList(),
    toPref: (value) => value.map((e) => e.toString()).toList(),
  );

  FastRxPrefsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fast_rx_prefs Example'),
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
    stringListPref.value.add(intPref.value.toString());
    transformedPref.value.add(intPref.value);
  }
}
