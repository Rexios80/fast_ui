import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fast_extensions/src/fast_material_localizations.dart';

import 'util.dart';

void main() {
  testWidgets(
    'FastMaterialLocalizations',
    (tester) => testContextExtensions(tester, (context) {
      final materialLocalizations = MaterialLocalizations.of(context);
      expect(
        context.aboutListTileTitle('title'),
        materialLocalizations.aboutListTileTitle('title'),
      );
      expect(
        context.alertDialogLabel,
        materialLocalizations.alertDialogLabel,
      );
      expect(
        context.anteMeridiemAbbreviation,
        materialLocalizations.anteMeridiemAbbreviation,
      );
      expect(
        context.backButtonTooltip,
        materialLocalizations.backButtonTooltip,
      );
      expect(
        context.calendarModeButtonLabel,
        materialLocalizations.calendarModeButtonLabel,
      );
      expect(
        context.cancelButtonLabel,
        materialLocalizations.cancelButtonLabel,
      );
      expect(
        context.closeButtonLabel,
        materialLocalizations.closeButtonLabel,
      );
      expect(
        context.closeButtonTooltip,
        materialLocalizations.closeButtonTooltip,
      );
      expect(
        context.collapsedIconTapHint,
        materialLocalizations.collapsedIconTapHint,
      );
      expect(
        context.continueButtonLabel,
        materialLocalizations.continueButtonLabel,
      );
      expect(
        context.copyButtonLabel,
        materialLocalizations.copyButtonLabel,
      );
      expect(
        context.copyButtonLabel,
        materialLocalizations.copyButtonLabel,
      );
      expect(
        context.cutButtonLabel,
        materialLocalizations.cutButtonLabel,
      );
      expect(
        context.dateHelpText,
        materialLocalizations.dateHelpText,
      );
      expect(
        context.dateInputLabel,
        materialLocalizations.dateInputLabel,
      );
      expect(
        context.dateOutOfRangeLabel,
        materialLocalizations.dateOutOfRangeLabel,
      );
      expect(
        context.datePickerHelpText,
        materialLocalizations.datePickerHelpText,
      );
      expect(
        context.dateRangeEndDateSemanticLabel('date'),
        materialLocalizations.dateRangeEndDateSemanticLabel('date'),
      );
      expect(
        context.dateRangeEndLabel,
        materialLocalizations.dateRangeEndLabel,
      );
      expect(
        context.dateRangePickerHelpText,
        materialLocalizations.dateRangePickerHelpText,
      );
      expect(
        context.dateRangeStartDateSemanticLabel('date'),
        materialLocalizations.dateRangeStartDateSemanticLabel('date'),
      );
      expect(
        context.dateRangeStartLabel,
        materialLocalizations.dateRangeStartLabel,
      );
      expect(
        context.dateSeparator,
        materialLocalizations.dateSeparator,
      );
      expect(
        context.deleteButtonTooltip,
        materialLocalizations.deleteButtonTooltip,
      );
      expect(
        context.dialModeButtonLabel,
        materialLocalizations.dialModeButtonLabel,
      );
      expect(
        context.dialogLabel,
        materialLocalizations.dialogLabel,
      );
      expect(
        context.drawerLabel,
        materialLocalizations.drawerLabel,
      );
      expect(
        context.expandedIconTapHint,
        materialLocalizations.expandedIconTapHint,
      );
      expect(
        context.firstDayOfWeekIndex,
        materialLocalizations.firstDayOfWeekIndex,
      );
      expect(
        context.firstPageTooltip,
        materialLocalizations.firstPageTooltip,
      );
      expect(
        context.formatCompactDate(DateTime.timestamp()),
        materialLocalizations.formatCompactDate(DateTime.timestamp()),
      );
      expect(
        context.formatDecimal(123),
        materialLocalizations.formatDecimal(123),
      );
      expect(
        context.formatFullDate(DateTime.timestamp()),
        materialLocalizations.formatFullDate(DateTime.timestamp()),
      );
      expect(
        context.formatHour(TimeOfDay.now()),
        materialLocalizations.formatHour(TimeOfDay.now()),
      );
      expect(
        context.formatMediumDate(DateTime.timestamp()),
        materialLocalizations.formatMediumDate(DateTime.timestamp()),
      );
      expect(
        context.formatMinute(TimeOfDay.now()),
        materialLocalizations.formatMinute(TimeOfDay.now()),
      );
      expect(
        context.formatMonthYear(DateTime.timestamp()),
        materialLocalizations.formatMonthYear(DateTime.timestamp()),
      );
      expect(
        context.formatShortDate(DateTime.timestamp()),
        materialLocalizations.formatShortDate(DateTime.timestamp()),
      );
      expect(
        context.formatShortMonthDay(DateTime.timestamp()),
        materialLocalizations.formatShortMonthDay(DateTime.timestamp()),
      );
      expect(
        context.formatTimeOfDay(TimeOfDay.now()),
        materialLocalizations.formatTimeOfDay(TimeOfDay.now()),
      );
      expect(
        context.formatYear(DateTime.timestamp()),
        materialLocalizations.formatYear(DateTime.timestamp()),
      );
      expect(
        context.hideAccountsLabel,
        materialLocalizations.hideAccountsLabel,
      );
      expect(
        context.inputDateModeButtonLabel,
        materialLocalizations.inputDateModeButtonLabel,
      );
      expect(
        context.inputTimeModeButtonLabel,
        materialLocalizations.inputTimeModeButtonLabel,
      );
      expect(
        context.invalidDateFormatLabel,
        materialLocalizations.invalidDateFormatLabel,
      );
      expect(
        context.invalidDateRangeLabel,
        materialLocalizations.invalidDateRangeLabel,
      );
      expect(
        context.invalidTimeLabel,
        materialLocalizations.invalidTimeLabel,
      );
      expect(
        context.lastPageTooltip,
        materialLocalizations.lastPageTooltip,
      );
      expect(
        context.licensesPackageDetailText(0),
        materialLocalizations.licensesPackageDetailText(0),
      );
      expect(
        context.licensesPageTitle,
        materialLocalizations.licensesPageTitle,
      );
      expect(
        context.modalBarrierDismissLabel,
        materialLocalizations.modalBarrierDismissLabel,
      );
      expect(
        context.moreButtonTooltip,
        materialLocalizations.moreButtonTooltip,
      );
      expect(
        context.narrowWeekdays,
        materialLocalizations.narrowWeekdays,
      );
      expect(
        context.nextMonthTooltip,
        materialLocalizations.nextMonthTooltip,
      );
      expect(
        context.nextPageTooltip,
        materialLocalizations.nextPageTooltip,
      );
      expect(
        context.okButtonLabel,
        materialLocalizations.okButtonLabel,
      );
      expect(
        context.openAppDrawerTooltip,
        materialLocalizations.openAppDrawerTooltip,
      );
      expect(
        context.pageRowsInfoTitle(1, 2, 3, true),
        materialLocalizations.pageRowsInfoTitle(1, 2, 3, true),
      );
      expect(
        context.parseCompactDate('01/01/2020'),
        materialLocalizations.parseCompactDate('01/01/2020'),
      );
      expect(
        context.pasteButtonLabel,
        materialLocalizations.pasteButtonLabel,
      );
      expect(
        context.popupMenuLabel,
        materialLocalizations.popupMenuLabel,
      );
      expect(
        context.postMeridiemAbbreviation,
        materialLocalizations.postMeridiemAbbreviation,
      );
      expect(
        context.previousMonthTooltip,
        materialLocalizations.previousMonthTooltip,
      );
      expect(
        context.previousPageTooltip,
        materialLocalizations.previousPageTooltip,
      );
      expect(
        context.refreshIndicatorSemanticLabel,
        materialLocalizations.refreshIndicatorSemanticLabel,
      );
      expect(
        context.remainingTextFieldCharacterCount(1),
        materialLocalizations.remainingTextFieldCharacterCount(1),
      );
      expect(
        context.rowsPerPageTitle,
        materialLocalizations.rowsPerPageTitle,
      );
      expect(
        context.saveButtonLabel,
        materialLocalizations.saveButtonLabel,
      );
      expect(
        context.scriptCategory,
        materialLocalizations.scriptCategory,
      );
      expect(
        context.searchFieldLabel,
        materialLocalizations.searchFieldLabel,
      );
      expect(
        context.selectAllButtonLabel,
        materialLocalizations.selectAllButtonLabel,
      );
      expect(
        context.selectYearSemanticsLabel,
        materialLocalizations.selectYearSemanticsLabel,
      );
      expect(
        context.selectedRowCountTitle(1),
        materialLocalizations.selectedRowCountTitle(1),
      );
      expect(
        context.showAccountsLabel,
        materialLocalizations.showAccountsLabel,
      );
      expect(
        context.showMenuTooltip,
        materialLocalizations.showMenuTooltip,
      );
      expect(
        context.signedInLabel,
        materialLocalizations.signedInLabel,
      );
      expect(
        context.tabLabel(tabIndex: 1, tabCount: 2),
        materialLocalizations.tabLabel(tabIndex: 1, tabCount: 2),
      );
      expect(
        context.timeOfDayFormat(),
        materialLocalizations.timeOfDayFormat(),
      );
      expect(
        context.timePickerDialHelpText,
        materialLocalizations.timePickerDialHelpText,
      );
      expect(
        context.timePickerHourLabel,
        materialLocalizations.timePickerHourLabel,
      );
      expect(
        context.timePickerHourModeAnnouncement,
        materialLocalizations.timePickerHourModeAnnouncement,
      );
      expect(
        context.timePickerInputHelpText,
        materialLocalizations.timePickerInputHelpText,
      );
      expect(
        context.timePickerMinuteLabel,
        materialLocalizations.timePickerMinuteLabel,
      );
      expect(
        context.timePickerMinuteModeAnnouncement,
        materialLocalizations.timePickerMinuteModeAnnouncement,
      );
      expect(
        context.unspecifiedDate,
        materialLocalizations.unspecifiedDate,
      );
      expect(
        context.unspecifiedDateRange,
        materialLocalizations.unspecifiedDateRange,
      );
      expect(
        context.viewLicensesButtonLabel,
        materialLocalizations.viewLicensesButtonLabel,
      );
    }),
  );
}
