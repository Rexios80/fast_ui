import 'dart:async';

import 'package:fast_nav/fast_nav.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

final routes = {
  '/': (context) => const Text('home'),
  'test_page': (context) => const Text('test_page'),
  'test_page_2': (context) => const Text('test_page_2'),
  'test_page_3': (context) => const Text('test_page_3'),
  'test_page_4': (context) => const Text('test_page_4'),
};

Widget buildMaterialApp() => MaterialApp(
      navigatorKey: FastNav.init(),
      routes: routes,
    );

Widget buildCupertinoApp() => CupertinoApp(
      navigatorKey: FastNav.init(),
      routes: routes,
    );

Widget buildNestedNavigatorWidget() => MaterialApp(
      home: NestedNavigator(
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
      expect((e as NavigatorNotRegistered).navigator, isNull);
    }
    try {
      FastNav.pop(navigator: 'test');
      throw 'Did not throw';
    } catch (e) {
      expect((e as NavigatorNotRegistered).navigator, 'test');
    }

    FastNav.reset();

    await tester.pumpWidget(
      MaterialApp(
        home: NestedNavigator(
          name: 'nestedNavigator',
          home: const SizedBox.shrink(),
        ),
      ),
    );
    // Should not throw
    unawaited(
      FastNav.push(
        const SizedBox.shrink(),
        navigator: 'nestedNavigator',
      ),
    );

    // Multiple init calls should return the same GlobalKey
    final key1 = FastNav.init();
    final key2 = FastNav.init();
    expect(key1, key2);
  });

  testWidgets('Anonymous routes', (tester) async {
    await tester.pumpWidget(buildMaterialApp());
    expect(FastNav.canPop(), false);

    Future<void> push([String name = 'test_page']) async {
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
    await tester.pumpWidget(buildMaterialApp());
    expect(FastNav.canPop(), false);

    Future<void> pushNamed([String name = 'test_page']) async {
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
    expect(FastNav.canPop(navigator: 'nestedNavigator'), false);

    Future<void> push({String name = 'test_page'}) async {
      unawaited(FastNav.push(Text(name), navigator: 'nestedNavigator'));
      await tester.pumpAndSettle();
    }

    await push();
    expect(find.text('test_page'), findsOneWidget);
    expect(FastNav.canPop(navigator: 'nestedNavigator'), true);

    FastNav.pop(navigator: 'nestedNavigator');
    await tester.pumpAndSettle();
    expect(find.text('home'), findsOneWidget);
    expect(FastNav.canPop(navigator: 'nestedNavigator'), false);
  });

  testWidgets('CupertinoRoute', (tester) async {
    await tester.pumpWidget(buildCupertinoApp());

    unawaited(
      FastNav.push(const Text('test_page'), routeType: RouteType.cupertino),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_page'), findsOneWidget);
  });
}
