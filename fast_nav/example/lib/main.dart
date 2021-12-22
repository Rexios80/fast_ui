import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: FastNav.init(GlobalKey<NavigatorState>()),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Page1(),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Push page 2'),
              onPressed: () => FastNav.push(const Page2()),
            ),
            ElevatedButton(
              child: const Text('Nested navigation'),
              onPressed: () => FastNav.push(const NestedPage1()),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pop page 2'),
          onPressed: () => FastNav.pop(),
        ),
      ),
    );
  }
}

class NestedPage1 extends StatelessWidget {
  const NestedPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NestedNavigator(
      navigatorKey: GlobalKey<NavigatorState>(),
      name: 'nested',
      home: Scaffold(
        appBar: AppBar(title: const Text('Nested Page 1')),
        body: Center(
          child: ElevatedButton(
            child: const Text('Push nested page'),
            onPressed: () =>
                FastNav.push(const NestedPage2(), navigatorName: 'nested'),
          ),
        ),
      ),
    );
  }
}

class NestedPage2 extends StatelessWidget {
  const NestedPage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nested Page 2')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pop nested page 2'),
          onPressed: () => FastNav.pop(navigatorName: 'nested'),
        ),
      ),
    );
  }
}
