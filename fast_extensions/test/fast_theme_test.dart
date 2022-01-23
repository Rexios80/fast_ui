import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fast_extensions/src/fast_theme.dart';

void main() {
  testWidgets('FastLocale', (tester) async {
    final widget = MaterialApp(
      home: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          expect(context.theme, theme);
          expect(context.isDarkMode, theme.brightness == Brightness.dark);
          expect(context.buttonTheme, theme.buttonTheme);
          expect(context.toggleButtonsTheme, theme.toggleButtonsTheme);
          expect(context.textTheme, theme.textTheme);
          expect(context.primaryTextTheme, theme.primaryTextTheme);
          expect(context.inputDecorationTheme, theme.inputDecorationTheme);
          expect(context.iconTheme, theme.iconTheme);
          expect(context.primaryIconTheme, theme.primaryIconTheme);
          expect(context.sliderTheme, theme.sliderTheme);
          expect(context.tabBarTheme, theme.tabBarTheme);
          expect(context.cardTheme, theme.cardTheme);
          expect(context.chipTheme, theme.chipTheme);
          expect(context.pageTransitionsTheme, theme.pageTransitionsTheme);
          expect(context.appBarTheme, theme.appBarTheme);
          expect(context.scrollbarTheme, theme.scrollbarTheme);
          expect(context.bottomAppBarTheme, theme.bottomAppBarTheme);
          expect(context.colorScheme, theme.colorScheme);
          expect(context.dialogTheme, theme.dialogTheme);
          expect(
            context.floatingActionButtonTheme,
            theme.floatingActionButtonTheme,
          );
          expect(context.navigationBarTheme, theme.navigationBarTheme);
          expect(context.navigationRailTheme, theme.navigationRailTheme);
          expect(context.snackBarTheme, theme.snackBarTheme);
          expect(context.bottomSheetTheme, theme.bottomSheetTheme);
          expect(context.popupMenuTheme, theme.popupMenuTheme);
          expect(context.bannerTheme, theme.bannerTheme);
          expect(context.dividerTheme, theme.dividerTheme);
          expect(context.buttonBarTheme, theme.buttonBarTheme);
          expect(
            context.bottomNavigationBarTheme,
            theme.bottomNavigationBarTheme,
          );
          expect(context.timePickerTheme, theme.timePickerTheme);
          expect(context.textButtonTheme, theme.textButtonTheme);
          expect(context.elevatedButtonTheme, theme.elevatedButtonTheme);
          expect(context.outlinedButtonTheme, theme.outlinedButtonTheme);
          expect(context.textSelectionTheme, theme.textSelectionTheme);
          expect(context.dataTableTheme, theme.dataTableTheme);
          expect(context.radioTheme, theme.radioTheme);
          expect(context.switchTheme, theme.switchTheme);
          expect(context.progressIndicatorTheme, theme.progressIndicatorTheme);
          expect(context.drawerTheme, theme.drawerTheme);
          expect(context.listTileTheme, theme.listTileTheme);
          return const SizedBox.shrink();
        },
      ),
    );
    await tester.pumpWidget(widget);
  });
}
