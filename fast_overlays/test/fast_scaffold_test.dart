import 'package:fast_overlays/fast_overlays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  buildBaseWidget() => MaterialApp(
        home: Scaffold(
          key: FastScaffold.register(),
          drawer: const Drawer(child: Text('test_drawer')),
          endDrawer: const Drawer(child: Text('test_end_drawer')),
        ),
      );

  test('Check init', () {
    expect(
      () => FastScaffold.openDrawer(),
      throwsA(isA<ScaffoldNotRegistered>()),
    );

    // Multiple register calls should return the same GlobalKey
    final key1 = FastScaffold.register();
    final key2 = FastScaffold.register();
    expect(key1, key2);
  });

  testWidgets('BottomSheet', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    FastScaffold.showBottomSheet((context) => const Text('test_bottom_sheet'));
    await tester.pumpAndSettle();
    expect(find.text('test_bottom_sheet'), findsOneWidget);
  });

  testWidgets('Drawer', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    FastScaffold.openDrawer();
    await tester.pumpAndSettle();
    expect(find.text('test_drawer'), findsOneWidget);

    FastScaffold.closeDrawer();
    await tester.pumpAndSettle();
    expect(find.text('test_drawer'), findsNothing);

    FastScaffold.openEndDrawer();
    await tester.pumpAndSettle();
    expect(find.text('test_end_drawer'), findsOneWidget);

    FastScaffold.closeEndDrawer();
    await tester.pumpAndSettle();
    expect(find.text('test_end_drawer'), findsNothing);
  });

  testWidgets('Duplicate keys', (tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Stack(
          children: [
            Scaffold(key: FastScaffold.register(name: 'scaffold_1')),
            Scaffold(key: FastScaffold.register(name: 'scaffold_2')),
          ],
        ),
      ),
    );

    FastScaffold.showBottomSheet(
      (context) => const Text('bottom_sheet_1'),
      scaffoldName: 'scaffold_1',
    );
    FastScaffold.showBottomSheet(
      (context) => const Text('bottom_sheet_2'),
      scaffoldName: 'scaffold_2',
    );

    await tester.pumpAndSettle();
    expect(find.text('bottom_sheet_1'), findsOneWidget);
    expect(find.text('bottom_sheet_2'), findsOneWidget);
  });
}
