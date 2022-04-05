import 'package:fast_ui/fast_ui.dart';
import 'package:flutter/material.dart';

class FastNavExample extends StatelessWidget {
  const FastNavExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('fast_nav Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Push page 2'),
              onPressed: () => FastNav.push(const Page2()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Push duplicate with prevention'),
              onPressed: () => FastNav.push(
                const FastNavExample(),
                preventDuplicates: true,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Push duplicate without prevention'),
              onPressed: () => FastNav.push(const FastNavExample()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Push nested navigator'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Pop page 2'),
              onPressed: () => FastNav.pop(),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('Replace with page 3'),
              onPressed: () => FastNav.pushReplacement(const Page3()),
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pop page 3'),
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
      name: 'nestedNavigator',
      home: Scaffold(
        appBar: AppBar(title: const Text('Nested Page 1')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('Push nested page 2'),
                onPressed: () => FastNav.push(
                  const NestedPage2(),
                  navigatorName: 'nestedNavigator',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const Text('Pop to root navigator'),
                onPressed: () => FastNav.pop(),
              ),
            ],
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
          onPressed: () => FastNav.pop(navigatorName: 'nestedNavigator'),
        ),
      ),
    );
  }
}