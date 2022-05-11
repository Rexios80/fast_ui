import 'package:fast_ui/fast_ui.dart';
import 'package:flutter/material.dart';

class FastRxExample extends StatelessWidget {
  final _rebuild = true.rx;
  final _int = 0.rx;
  final _list = [0].rx;
  final _set = {0}.rx;
  final _map = {0: 0}.rx;

  FastRxExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fast_rx Example'),
      ),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: <Widget>[
            const Text('Reactive int:'),
            FastBuilder(
              () => Text(
                '$_int',
                style: Theme.of(context).textTheme.headline4,
              ),
              condition: () => _rebuild.value,
            ),
            const SizedBox(height: 16),
            const Text('Reactive list:'),
            FastBuilder(
              () => Text(
                '$_list',
                style: Theme.of(context).textTheme.headline4,
              ),
              condition: () => _rebuild.value,
            ),
            const SizedBox(height: 16),
            const Text('Reactive set:'),
            FastBuilder(
              () => Text(
                '$_set',
                style: Theme.of(context).textTheme.headline4,
              ),
              condition: () => _rebuild.value,
            ),
            const SizedBox(height: 16),
            const Text('Reactive map:'),
            FastBuilder(
              () => Text(
                '$_map',
                style: Theme.of(context).textTheme.headline4,
              ),
              condition: () => _rebuild.value,
            ),
            const SizedBox(height: 32),
            FastBuilder(
              () => ElevatedButton(
                child:
                    Text('${_rebuild.value ? 'Disable' : 'Enable'} rebuild'),
                onPressed: () => _rebuild.value = !_rebuild.value,
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
    _int.value++;
    _list.add(_int.value);
    _set.add(_int.value);
    _map[_int.value] = _int.value;
  }
}
