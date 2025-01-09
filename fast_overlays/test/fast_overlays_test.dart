import 'dart:async';

import 'package:fast_overlays/fast_overlays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget buildBaseWidget() => MaterialApp(
        navigatorKey: FastOverlays.init(),
        home: const Scaffold(),
      );

  test('Check init', () {
    expect(
      FastOverlays.hideCurrentSnackBar,
      throwsA(isA<FastOverlaysNotInitialized>()),
    );

    // Multiple init calls should return the same GlobalKey
    final key1 = FastOverlays.init();
    final key2 = FastOverlays.init();
    expect(key1, key2);
  });

  testWidgets('Snackbar', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    Future<void> showSnackbar([String name = 'test_snackbar']) async {
      FastOverlays.showSnackBar(SnackBar(content: Text(name)));
      await tester.pumpAndSettle();
    }

    await showSnackbar();
    expect(find.text('test_snackbar'), findsOneWidget);

    FastOverlays.hideCurrentSnackBar();
    await tester.pumpAndSettle();
    expect(find.text('test_snackbar'), findsNothing);

    await showSnackbar();
    FastOverlays.removeCurrentSnackBar();
    await tester.pumpAndSettle();
    expect(find.text('test_snackbar'), findsNothing);

    await showSnackbar();
    await showSnackbar('test_snackbar_2');
    FastOverlays.clearSnackBars();
    await tester.pumpAndSettle();
    expect(find.text('test_snackbar'), findsNothing);
    expect(find.text('test_snackbar_2'), findsNothing);
  });

  testWidgets('MaterialBanner', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    Future<void> showMaterialBanner([String name = 'test_banner']) async {
      FastOverlays.showMaterialBanner(
        MaterialBanner(
          content: Text(name),
          actions: const [SizedBox.shrink()],
        ),
      );
      await tester.pumpAndSettle();
    }

    await showMaterialBanner();
    expect(find.text('test_banner'), findsOneWidget);

    FastOverlays.hideCurrentMaterialBanner();
    await tester.pumpAndSettle();
    expect(find.text('test_banner'), findsNothing);

    await showMaterialBanner();
    FastOverlays.removeCurrentMaterialBanner();
    await tester.pumpAndSettle();
    expect(find.text('test_banner'), findsNothing);

    await showMaterialBanner();
    await showMaterialBanner('test_banner_2');
    FastOverlays.clearMaterialBanners();
    await tester.pumpAndSettle();
    expect(find.text('test_banner'), findsNothing);
    expect(find.text('test_banner_2'), findsNothing);
  });

  testWidgets('ModalBottomSheet', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    unawaited(
      FastOverlays.showModalBottomSheet(
        builder: (context) => const Text('test_sheet'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_sheet'), findsOneWidget);
  });

  testWidgets('DatePicker', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    unawaited(
      FastOverlays.showDatePicker(
        initialDate: DateTime.timestamp(),
        firstDate: DateTime.timestamp(),
        lastDate: DateTime.timestamp(),
        helpText: 'test_date_picker',
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_date_picker'), findsOneWidget);
  });

  testWidgets('DateRangePicker', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    unawaited(
      FastOverlays.showDateRangePicker(
        firstDate: DateTime.timestamp(),
        lastDate: DateTime.timestamp(),
        helpText: 'test_date_range_picker',
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_date_range_picker'), findsOneWidget);
  });

  testWidgets('TimePicker', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    unawaited(
      FastOverlays.showTimePicker(
        initialTime: TimeOfDay.now(),
        helpText: 'test_time_picker',
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_time_picker'), findsOneWidget);
  });

  testWidgets('LicensePage', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    FastOverlays.showLicensePage(
      applicationName: 'test_license_page',
    );
    await tester.pumpAndSettle();
    expect(find.text('test_license_page'), findsOneWidget);
  });

  testWidgets('Search', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    unawaited(
      FastOverlays.showSearch(
        delegate: TestSearchDelegate(),
        query: 'test_search',
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_search'), findsOneWidget);
  });

  testWidgets('Menu', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    unawaited(
      FastOverlays.showMenu(
        position: const RelativeRect.fromLTRB(0, 0, 0, 0),
        items: [const PopupMenuItem(child: Text('test_menu'))],
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_menu'), findsOneWidget);
  });

  testWidgets('Dialog', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    unawaited(
      FastOverlays.showDialog(
        builder: (context) => const Text('test_dialog'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_dialog'), findsOneWidget);
  });

  testWidgets('AboutDialog', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    FastOverlays.showAboutDialog(
      applicationName: 'test_about_dialog',
    );
    await tester.pumpAndSettle();
    expect(find.text('test_about_dialog'), findsOneWidget);
  });

  testWidgets('GeneralDialog', (tester) async {
    await tester.pumpWidget(buildBaseWidget());

    unawaited(
      FastOverlays.showGeneralDialog(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const Text('test_general_dialog'),
      ),
    );
    await tester.pumpAndSettle();
    expect(find.text('test_general_dialog'), findsOneWidget);
  });
}

class TestSearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return null;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox.shrink();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return const SizedBox.shrink();
  }
}
