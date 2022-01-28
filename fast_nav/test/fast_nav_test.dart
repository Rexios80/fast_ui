import 'dart:async';

import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  buildBaseWidget() => MaterialApp(
        navigatorKey: FastNav.init(GlobalKey<NavigatorState>()),
        home: const Text('home'),
        routes: {
          'test_page': (context) => const Text('test_page'),
          'test_page_2': (context) => const Text('test_page_2'),
          'test_page_3': (context) => const Text('test_page_3'),
          'test_page_4': (context) => const Text('test_page_4'),
        },
      );

  test('Check init', () {
    try {
      FastNav.pop();
    } catch (e) {
      expect((e as NavigatorNotRegistered).navigatorName, isNull);
    }
    try {
      FastNav.pop(navigatorName: 'test');
    } catch (e) {
      expect((e as NavigatorNotRegistered).navigatorName, 'test');
    }
  });

  testWidgets('Anonymous routes', (tester) async {
    await tester.pumpWidget(buildBaseWidget());
    expect(FastNav.canPop(), false);

    push([String name = 'test_page']) async {
      unawaited(FastNav.push(Text(name)));
      await tester.pumpAndSettle();
    }

    await push();
    expect(find.text('test_page'), findsOneWidget);
    expect(FastNav.canPop(), true);

    FastNav.pop();
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);

    unawaited(FastNav.pushReplacement(const Text('test_page')));
    await tester.pumpAndSettle();
    expect(find.text('test_page'), findsOneWidget);
    expect(FastNav.canPop(), false);

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
    expect(FastNav.canPop(), true);
    FastNav.pop();
    await tester.pumpAndSettle();
    expect(find.text('test_page'), findsOneWidget);
    expect(FastNav.canPop(), false);

    // pushAndRemoveAll
    await push('test_page_2');
    await push('test_page_3');
    unawaited(FastNav.pushAndRemoveAll(const Text('test_page_4')));
    await tester.pumpAndSettle();
    expect(find.text('test_page_4'), findsOneWidget);
    expect(FastNav.canPop(), false);
  });

  testWidgets('Named routes', (tester) async {
    await tester.pumpWidget(buildBaseWidget());
    expect(FastNav.canPop(), false);

    pushNamed([String name = 'test_page']) async {
      unawaited(FastNav.pushNamed(name));
      await tester.pumpAndSettle();
    }

    await pushNamed();
    expect(find.text('test_page'), findsOneWidget);
    expect(FastNav.canPop(), true);

    FastNav.pop();
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);

    unawaited(FastNav.pushReplacementNamed('test_page'));
    await tester.pumpAndSettle();
    expect(find.text('test_page'), findsOneWidget);
    expect(FastNav.canPop(), false);

    // pushNamedAndRemoveUntil
    await pushNamed('test_page_2');
    await pushNamed('test_page_3');
    unawaited(
      FastNav.pushNamedAndRemoveUntil('test_page_4', (route) => route.isFirst),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_page_4'), findsOneWidget);
    // There should be one page left under test_page_4
    expect(FastNav.canPop(), true);
    FastNav.pop();
    await tester.pumpAndSettle();
    expect(find.text('test_page'), findsOneWidget);
    expect(FastNav.canPop(), false);

    // pushNamedAndRemoveAll
    await pushNamed('test_page_2');
    await pushNamed('test_page_3');
    unawaited(FastNav.pushNamedAndRemoveAll('test_page_4'));
    await tester.pumpAndSettle();
    expect(find.text('test_page_4'), findsOneWidget);
    expect(FastNav.canPop(), false);
  });

  testWidgets('NestedNavigator', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: NestedNavigator(
          navigatorKey: GlobalKey<NavigatorState>(),
          name: 'nested',
          home: const Text('home'),
        ),
      ),
    );
    expect(find.text('home'), findsOneWidget);
    expect(FastNav.canPop(navigatorName: 'nested'), false);

    push({String name = 'test_page'}) async {
      unawaited(FastNav.push(Text(name), navigatorName: 'nested'));
      await tester.pumpAndSettle();
    }

    await push();
    expect(find.text('test_page'), findsOneWidget);
    expect(FastNav.canPop(navigatorName: 'nested'), true);

    FastNav.pop(navigatorName: 'nested');
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);
    expect(FastNav.canPop(navigatorName: 'nested'), false);
  });
}
