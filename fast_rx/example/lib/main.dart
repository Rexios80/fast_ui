import 'package:fast_rx/fast_rx.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _int = 0.rx;
  final _list = [0].rx;
  final _set = {0}.rx;
  final _map = {0: 0}.rx;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('fast_rx example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Reactive int:'),
            FastBuilder(
              builder: () => Text(
                '$_int',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Text('Reactive list:'),
            FastBuilder(
              builder: () => Text(
                '$_list',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Text('Reactive set:'),
            FastBuilder(
              builder: () => Text(
                '$_set',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            const Text('Reactive map:'),
            FastBuilder(
              builder: () => Text(
                '$_map',
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
    _int.value++;
    _list.add(_int.value);
    _set.add(_int.value);
    _map[_int.value] = _int.value;
  }
}
