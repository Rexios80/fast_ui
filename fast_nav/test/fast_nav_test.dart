import 'dart:async';

import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final key = GlobalKey<NavigatorState>();
  buildBaseWidget() => MaterialApp(
        navigatorKey: FastNav.init(key),
        home: const Text('home'),
        routes: {
          'test_page': (context) => const Text('test_page'),
          'test_page_2': (context) => const Text('test_page_2'),
          'test_page_3': (context) => const Text('test_page_3'),
          'test_page_4': (context) => const Text('test_page_4'),
        },
      );

  test('Check init', () {
    expect(() => FastNav.pop(), throwsException);
    expect(() => FastNav.pop(navigatorName: 'test'), throwsException);
  });

  testWidgets('Anonymous routes', (tester) async {
    await tester.pumpWidget(buildBaseWidget());
    expect(key.currentState!.canPop(), false);

    push([String name = 'test_page']) async {
      unawaited(FastNav.push(Text(name)));
      await tester.pumpAndSettle();
    }

    await push();
    expect(find.text('test_page'), findsOneWidget);
    expect(key.currentState!.canPop(), true);

    FastNav.pop();
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);

    unawaited(FastNav.pushReplacement(const Text('test_page')));
    await tester.pumpAndSettle();
    expect(find.text('test_page'), findsOneWidget);
    expect(key.currentState!.canPop(), false);

    // pushAndRemoveUntil
    await push('test_page_2');
    await push('test_page_3');
    unawaited(
      FastNav.pushAndRemoveUntil(
        const Text('test_page_4'),
        (route) => route.isFirst,
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_page_4'), findsOneWidget);
    // There should be one page left under test_page_4
    expect(key.currentState!.canPop(), true);
    FastNav.pop();
    await tester.pumpAndSettle();
    expect(find.text('test_page'), findsOneWidget);
    expect(key.currentState!.canPop(), false);

    // pushAndRemoveAll
    await push('test_page_2');
    await push('test_page_3');
    unawaited(FastNav.pushAndRemoveAll(const Text('test_page_4')));
    await tester.pumpAndSettle();
    expect(find.text('test_page_4'), findsOneWidget);
    expect(key.currentState!.canPop(), false);
  });

  testWidgets('Named routes', (tester) async {
    await tester.pumpWidget(buildBaseWidget());
    expect(key.currentState!.canPop(), false);

    pushNamed([String name = 'test_page']) async {
      unawaited(FastNav.pushNamed(name));
      await tester.pumpAndSettle();
    }

    await pushNamed();
    expect(find.text('test_page'), findsOneWidget);
    expect(key.currentState!.canPop(), true);

    FastNav.pop();
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);

    unawaited(FastNav.pushReplacementNamed('test_page'));
    await tester.pumpAndSettle();
    expect(find.text('test_page'), findsOneWidget);
    expect(key.currentState!.canPop(), false);

    // pushNamedAndRemoveUntil
    await pushNamed('test_page_2');
    await pushNamed('test_page_3');
    unawaited(
      FastNav.pushNamedAndRemoveUntil('test_page_4', (route) => route.isFirst),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_page_4'), findsOneWidget);
    // There should be one page left under test_page_4
    expect(key.currentState!.canPop(), true);
    FastNav.pop();
    await tester.pumpAndSettle();
    expect(find.text('test_page'), findsOneWidget);
    expect(key.currentState!.canPop(), false);

    // pushNamedAndRemoveAll
    await pushNamed('test_page_2');
    await pushNamed('test_page_3');
    unawaited(FastNav.pushNamedAndRemoveAll('test_page_4'));
    await tester.pumpAndSettle();
    expect(find.text('test_page_4'), findsOneWidget);
    expect(key.currentState!.canPop(), false);
  });
}
