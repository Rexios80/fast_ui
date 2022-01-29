import 'dart:async';

import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Widget buildBaseWidget() => MaterialApp(
      navigatorKey: FastNav.init(GlobalKey<NavigatorState>()),
      navigatorObservers: [FastNavObserver()],
      home: const Text('home'),
      routes: {
        'test_page': (context) => const Text('test_page'),
        'test_page_2': (context) => const Text('test_page_2'),
        'test_page_3': (context) => const Text('test_page_3'),
        'test_page_4': (context) => const Text('test_page_4'),
      },
    );

Widget buildNestedNavigatorWidget() => MaterialApp(
      home: NestedNavigator(
        navigatorKey: GlobalKey<NavigatorState>(),
        name: 'nestedNavigator',
        home: const Text('home'),
      ),
    );

void main() {
  testWidgets('Check init', (tester) async {
    try {
      FastNav.pop();
      throw 'Did not throw';
    } catch (e) {
      expect((e as NavigatorNotRegistered).navigatorName, isNull);
    }
    try {
      FastNav.pop(navigatorName: 'test');
      throw 'Did not throw';
    } catch (e) {
      expect((e as NavigatorNotRegistered).navigatorName, 'test');
    }

    await tester.pumpWidget(buildBaseWidget());
    try {
      unawaited(FastNav.push(const SizedBox.shrink(), preventDuplicates: true));
      throw 'Did not throw';
    } catch (e) {
      expect((e as NavigatorObserverNotRegistered).navigatorName, isNull);
    }

    await tester.pumpWidget(buildNestedNavigatorWidget());
    // Should not throw
    unawaited(
      FastNav.push(
        const SizedBox.shrink(),
        navigatorName: 'nestedNavigator',
        preventDuplicates: true,
      ),
    );
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
    await tester.pumpWidget(buildNestedNavigatorWidget());
    expect(find.text('home'), findsOneWidget);
    expect(FastNav.canPop(navigatorName: 'nestedNavigator'), false);

    push({String name = 'test_page'}) async {
      unawaited(FastNav.push(Text(name), navigatorName: 'nestedNavigator'));
      await tester.pumpAndSettle();
    }

    await push();
    expect(find.text('test_page'), findsOneWidget);
    expect(FastNav.canPop(navigatorName: 'nestedNavigator'), true);

    FastNav.pop(navigatorName: 'nestedNavigator');
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);
    expect(FastNav.canPop(navigatorName: 'nestedNavigator'), false);
  });
}
