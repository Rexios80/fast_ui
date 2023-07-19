import 'package:fast_ui/fast_ui.dart';
import 'package:flutter/material.dart';

class FastNavExample extends StatelessWidget {
  const FastNavExample({super.key});

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
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ElevatedButton(
              onPressed: FastNav.pop,
              child: Text('Pop page 2'),
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
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 3')),
      body: const Center(
        child: ElevatedButton(
          onPressed: FastNav.pop,
          child: Text('Pop page 3'),
        ),
      ),
    );
  }
}

class NestedPage1 extends StatelessWidget {
  const NestedPage1({super.key});

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
              const ElevatedButton(
                onPressed: FastNav.pop,
                child: Text('Pop to root navigator'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NestedPage2 extends StatelessWidget {
  const NestedPage2({super.key});

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
