import 'package:flutter/material.dart';

/// Extension on [BuildContext] to read [MaterialLocalizations] information
extension FastLocalizationExtension on BuildContext {
  /// The [MaterialLocalizations] of the current [BuildContext]
  MaterialLocalizations get materialLocalizations =>
      MaterialLocalizations.of(this);

  /// The [MaterialLocalizations.aboutListTileTitle] of the current [BuildContext]
  String aboutListTileTitle(String applicationName) =>
      materialLocalizations.aboutListTileTitle(applicationName);

  /// The [MaterialLocalizations.alertDialogLabel] of the current [BuildContext]
  String get alertDialogLabel => materialLocalizations.alertDialogLabel;

  /// The [MaterialLocalizations.anteMeridiemAbbreviation] of the current [BuildContext]
  String get anteMeridiemAbbreviation =>
      materialLocalizations.anteMeridiemAbbreviation;

  /// The [MaterialLocalizations.backButtonTooltip] of the current [BuildContext]
  String get backButtonTooltip => materialLocalizations.backButtonTooltip;

  /// The [MaterialLocalizations.calendarModeButtonLabel] of the current [BuildContext]
  String get calendarModeButtonLabel =>
      materialLocalizations.calendarModeButtonLabel;

  /// The [MaterialLocalizations.cancelButtonLabel] of the current [BuildContext]
  String get cancelButtonLabel => materialLocalizations.cancelButtonLabel;

  /// The [MaterialLocalizations.closeButtonLabel] of the current [BuildContext]
  String get closeButtonLabel => materialLocalizations.closeButtonLabel;

  /// The [MaterialLocalizations.closeButtonTooltip] of the current [BuildContext]
  String get closeButtonTooltip => materialLocalizations.closeButtonTooltip;

  /// The [MaterialLocalizations.collapsedIconTapHint] of the current [BuildContext]
  String get collapsedIconTapHint => materialLocalizations.collapsedIconTapHint;

  /// The [MaterialLocalizations.continueButtonLabel] of the current [BuildContext]
  String get continueButtonLabel => materialLocalizations.continueButtonLabel;

  /// The [MaterialLocalizations.copyButtonLabel] of the current [BuildContext]
  String get copyButtonLabel => materialLocalizations.copyButtonLabel;

  /// The [MaterialLocalizations.cutButtonLabel] of the current [BuildContext]
  String get cutButtonLabel => materialLocalizations.cutButtonLabel;

  /// The [MaterialLocalizations.dateHelpText] of the current [BuildContext]
  String get dateHelpText => materialLocalizations.dateHelpText;

  /// The [MaterialLocalizations.dateInputLabel] of the current [BuildContext]
  String get dateInputLabel => materialLocalizations.dateInputLabel;

  /// The [MaterialLocalizations.dateOutOfRangeLabel] of the current [BuildContext]
  String get dateOutOfRangeLabel => materialLocalizations.dateOutOfRangeLabel;

  /// The [MaterialLocalizations.datePickerHelpText] of the current [BuildContext]
  String get datePickerHelpText => materialLocalizations.datePickerHelpText;

  /// The [MaterialLocalizations.dateRangeEndDateSemanticLabel] of the current [BuildContext]
  String dateRangeEndDateSemanticLabel(String formattedDate) =>
      materialLocalizations.dateRangeEndDateSemanticLabel(formattedDate);

  /// The [MaterialLocalizations.dateRangeEndLabel] of the current [BuildContext]
  String get dateRangeEndLabel => materialLocalizations.dateRangeEndLabel;

  /// The [MaterialLocalizations.dateRangePickerHelpText] of the current [BuildContext]
  String get dateRangePickerHelpText =>
      materialLocalizations.dateRangePickerHelpText;

  /// The [MaterialLocalizations.dateRangeStartDateSemanticLabel] of the current [BuildContext]
  String dateRangeStartDateSemanticLabel(String formattedDate) =>
      materialLocalizations.dateRangeStartDateSemanticLabel(formattedDate);

  /// The [MaterialLocalizations.dateRangeStartLabel] of the current [BuildContext]
  String get dateRangeStartLabel => materialLocalizations.dateRangeStartLabel;

  /// The [MaterialLocalizations.dateSeparator] of the current [BuildContext]
  String get dateSeparator => materialLocalizations.dateSeparator;

  /// The [MaterialLocalizations.deleteButtonTooltip] of the current [BuildContext]
  String get deleteButtonTooltip => materialLocalizations.deleteButtonTooltip;

  /// The [MaterialLocalizations.dialModeButtonLabel] of the current [BuildContext]
  String get dialModeButtonLabel => materialLocalizations.dialModeButtonLabel;

  /// The [MaterialLocalizations.dialogLabel] of the current [BuildContext]
  String get dialogLabel => materialLocalizations.dialogLabel;

  /// The [MaterialLocalizations.drawerLabel] of the current [BuildContext]
  String get drawerLabel => materialLocalizations.drawerLabel;

  /// The [MaterialLocalizations.expandedIconTapHint] of the current [BuildContext]
  String get expandedIconTapHint => materialLocalizations.expandedIconTapHint;

  /// The [MaterialLocalizations.firstDayOfWeekIndex] of the current [BuildContext]
  int get firstDayOfWeekIndex => materialLocalizations.firstDayOfWeekIndex;

  /// The [MaterialLocalizations.firstPageTooltip] of the current [BuildContext]
  String get firstPageTooltip => materialLocalizations.firstPageTooltip;

  /// The [MaterialLocalizations.formatCompactDate] of the current [BuildContext]
  String formatCompactDate(DateTime date) =>
      materialLocalizations.formatCompactDate(date);

  /// The [MaterialLocalizations.formatDecimal] of the current [BuildContext]
  String formatDecimal(int number) =>
      materialLocalizations.formatDecimal(number);

  /// The [MaterialLocalizations.formatFullDate] of the current [BuildContext]
  String formatFullDate(DateTime date) =>
      materialLocalizations.formatFullDate(date);

  /// The [MaterialLocalizations.formatHour] of the current [BuildContext]
  String formatHour(
    TimeOfDay timeOfDay, {
    bool alwaysUse24HourFormat = false,
  }) =>
      materialLocalizations.formatHour(
        timeOfDay,
        alwaysUse24HourFormat: alwaysUse24HourFormat,
      );

  /// The [MaterialLocalizations.formatMediumDate] of the current [BuildContext]
  String formatMediumDate(DateTime date) =>
      materialLocalizations.formatMediumDate(date);

  /// The [MaterialLocalizations.formatMinute] of the current [BuildContext]
  String formatMinute(TimeOfDay timeOfDay) =>
      materialLocalizations.formatMinute(timeOfDay);

  /// The [MaterialLocalizations.formatMonthYear] of the current [BuildContext]
  String formatMonthYear(DateTime date) =>
      materialLocalizations.formatMonthYear(date);

  /// The [MaterialLocalizations.formatShortDate] of the current [BuildContext]
  String formatShortDate(DateTime date) =>
      materialLocalizations.formatShortDate(date);

  /// The [MaterialLocalizations.formatShortMonthDay] of the current [BuildContext]
  String formatShortMonthDay(DateTime date) =>
      materialLocalizations.formatShortMonthDay(date);

  /// The [MaterialLocalizations.formatTimeOfDay] of the current [BuildContext]
  String formatTimeOfDay(
    TimeOfDay timeOfDay, {
    bool alwaysUse24HourFormat = false,
  }) =>
      materialLocalizations.formatTimeOfDay(
        timeOfDay,
        alwaysUse24HourFormat: alwaysUse24HourFormat,
      );

  /// The [MaterialLocalizations.formatYear] of the current [BuildContext]
  String formatYear(DateTime date) => materialLocalizations.formatYear(date);

  /// The [MaterialLocalizations.hideAccountsLabel] of the current [BuildContext]
  String get hideAccountsLabel => materialLocalizations.hideAccountsLabel;

  /// The [MaterialLocalizations.inputDateModeButtonLabel] of the current [BuildContext]
  String get inputDateModeButtonLabel =>
      materialLocalizations.inputDateModeButtonLabel;

  /// The [MaterialLocalizations.inputTimeModeButtonLabel] of the current [BuildContext]
  String get inputTimeModeButtonLabel =>
      materialLocalizations.inputTimeModeButtonLabel;

  /// The [MaterialLocalizations.invalidDateFormatLabel] of the current [BuildContext]
  String get invalidDateFormatLabel =>
      materialLocalizations.invalidDateFormatLabel;

  /// The [MaterialLocalizations.invalidDateRangeLabel] of the current [BuildContext]
  String get invalidDateRangeLabel =>
      materialLocalizations.invalidDateRangeLabel;

  /// The [MaterialLocalizations.invalidTimeLabel] of the current [BuildContext]
  String get invalidTimeLabel => materialLocalizations.invalidTimeLabel;

  /// The [MaterialLocalizations.lastPageTooltip] of the current [BuildContext]
  String get lastPageTooltip => materialLocalizations.lastPageTooltip;

  /// The [MaterialLocalizations.licensesPackageDetailText] of the current [BuildContext]
  String licensesPackageDetailText(int licenseCount) =>
      materialLocalizations.licensesPackageDetailText(licenseCount);

  /// The [MaterialLocalizations.licensesPageTitle] of the current [BuildContext]
  String get licensesPageTitle => materialLocalizations.licensesPageTitle;

  /// The [MaterialLocalizations.modalBarrierDismissLabel] of the current [BuildContext]
  String get modalBarrierDismissLabel =>
      materialLocalizations.modalBarrierDismissLabel;

  /// The [MaterialLocalizations.moreButtonTooltip] of the current [BuildContext]
  String get moreButtonTooltip => materialLocalizations.moreButtonTooltip;

  /// The [MaterialLocalizations.narrowWeekdays] of the current [BuildContext]
  List<String> get narrowWeekdays => materialLocalizations.narrowWeekdays;

  /// The [MaterialLocalizations.nextMonthTooltip] of the current [BuildContext]
  String get nextMonthTooltip => materialLocalizations.nextMonthTooltip;

  /// The [MaterialLocalizations.nextPageTooltip] of the current [BuildContext]
  String get nextPageTooltip => materialLocalizations.nextPageTooltip;

  /// The [MaterialLocalizations.okButtonLabel] of the current [BuildContext]
  String get okButtonLabel => materialLocalizations.okButtonLabel;

  /// The [MaterialLocalizations.openAppDrawerTooltip] of the current [BuildContext]
  String get openAppDrawerTooltip => materialLocalizations.openAppDrawerTooltip;

  /// The [MaterialLocalizations.pageRowsInfoTitle] of the current [BuildContext]
  String pageRowsInfoTitle(
    int firstRow,
    int lastRow,
    int rowCount,
    bool rowCountIsApproximate,
  ) =>
      materialLocalizations.pageRowsInfoTitle(
        firstRow,
        lastRow,
        rowCount,
        rowCountIsApproximate,
      );

  /// The [MaterialLocalizations.parseCompactDate] of the current [BuildContext]
  DateTime? parseCompactDate(String? inputString) =>
      materialLocalizations.parseCompactDate(inputString);

  /// The [MaterialLocalizations.pasteButtonLabel] of the current [BuildContext]
  String get pasteButtonLabel => materialLocalizations.pasteButtonLabel;

  /// The [MaterialLocalizations.popupMenuLabel] of the current [BuildContext]
  String get popupMenuLabel => materialLocalizations.popupMenuLabel;

  /// The [MaterialLocalizations.postMeridiemAbbreviation] of the current [BuildContext]
  String get postMeridiemAbbreviation =>
      materialLocalizations.postMeridiemAbbreviation;

  /// The [MaterialLocalizations.previousMonthTooltip] of the current [BuildContext]
  String get previousMonthTooltip => materialLocalizations.previousMonthTooltip;

  /// The [MaterialLocalizations.previousPageTooltip] of the current [BuildContext]
  String get previousPageTooltip => materialLocalizations.previousPageTooltip;

  /// The [MaterialLocalizations.refreshIndicatorSemanticLabel] of the current [BuildContext]
  String get refreshIndicatorSemanticLabel =>
      materialLocalizations.refreshIndicatorSemanticLabel;

  /// The [MaterialLocalizations.remainingTextFieldCharacterCount] of the current [BuildContext]
  String remainingTextFieldCharacterCount(int remaining) =>
      materialLocalizations.remainingTextFieldCharacterCount(remaining);

  /// The [MaterialLocalizations.reorderItemDown] of the current [BuildContext]
  String get reorderItemDown => materialLocalizations.reorderItemDown;

  /// The [MaterialLocalizations.reorderItemLeft] of the current [BuildContext]
  String get reorderItemLeft => materialLocalizations.reorderItemLeft;

  /// The [MaterialLocalizations.reorderItemRight] of the current [BuildContext]
  String get reorderItemRight => materialLocalizations.reorderItemRight;

  /// The [MaterialLocalizations.reorderItemToEnd] of the current [BuildContext]
  String get reorderItemToEnd => materialLocalizations.reorderItemToEnd;

  /// The [MaterialLocalizations.reorderItemToStart] of the current [BuildContext]
  String get reorderItemToStart => materialLocalizations.reorderItemToStart;

  /// The [MaterialLocalizations.reorderItemUp] of the current [BuildContext]
  String get reorderItemUp => materialLocalizations.reorderItemUp;

  /// The [MaterialLocalizations.rowsPerPageTitle] of the current [BuildContext]
  String get rowsPerPageTitle => materialLocalizations.rowsPerPageTitle;

  /// The [MaterialLocalizations.saveButtonLabel] of the current [BuildContext]
  String get saveButtonLabel => materialLocalizations.saveButtonLabel;

  /// The [MaterialLocalizations.scriptCategory] of the current [BuildContext]
  ScriptCategory get scriptCategory => materialLocalizations.scriptCategory;

  /// The [MaterialLocalizations.searchFieldLabel] of the current [BuildContext]
  String get searchFieldLabel => materialLocalizations.searchFieldLabel;

  /// The [MaterialLocalizations.selectAllButtonLabel] of the current [BuildContext]
  String get selectAllButtonLabel => materialLocalizations.selectAllButtonLabel;

  /// The [MaterialLocalizations.selectYearSemanticsLabel] of the current [BuildContext]
  String get selectYearSemanticsLabel =>
      materialLocalizations.selectYearSemanticsLabel;

  /// The [MaterialLocalizations.selectedRowCountTitle] of the current [BuildContext]
  String selectedRowCountTitle(int selectedRowCount) =>
      materialLocalizations.selectedRowCountTitle(selectedRowCount);

  /// The [MaterialLocalizations.showAccountsLabel] of the current [BuildContext]
  String get showAccountsLabel => materialLocalizations.showAccountsLabel;

  /// The [MaterialLocalizations.showMenuTooltip] of the current [BuildContext]
  String get showMenuTooltip => materialLocalizations.showMenuTooltip;

  /// The [MaterialLocalizations.signedInLabel] of the current [BuildContext]
  String get signedInLabel => materialLocalizations.signedInLabel;

  /// The [MaterialLocalizations.tabLabel] of the current [BuildContext]
  String tabLabel({required int tabIndex, required int tabCount}) =>
      materialLocalizations.tabLabel(tabIndex: tabIndex, tabCount: tabCount);

  /// The [MaterialLocalizations.timeOfDayFormat] of the current [BuildContext]
  TimeOfDayFormat timeOfDayFormat({bool alwaysUse24HourFormat = false}) =>
      materialLocalizations.timeOfDayFormat(
        alwaysUse24HourFormat: alwaysUse24HourFormat,
      );

  /// The [MaterialLocalizations.timePickerDialHelpText] of the current [BuildContext]
  String get timePickerDialHelpText =>
      materialLocalizations.timePickerDialHelpText;

  /// The [MaterialLocalizations.timePickerHourLabel] of the current [BuildContext]
  String get timePickerHourLabel => materialLocalizations.timePickerHourLabel;

  /// The [MaterialLocalizations.timePickerHourModeAnnouncement] of the current [BuildContext]
  String get timePickerHourModeAnnouncement =>
      materialLocalizations.timePickerHourModeAnnouncement;

  /// The [MaterialLocalizations.timePickerInputHelpText] of the current [BuildContext]
  String get timePickerInputHelpText =>
      materialLocalizations.timePickerInputHelpText;

  /// The [MaterialLocalizations.timePickerMinuteLabel] of the current [BuildContext]
  String get timePickerMinuteLabel =>
      materialLocalizations.timePickerMinuteLabel;

  /// The [MaterialLocalizations.timePickerMinuteModeAnnouncement] of the current [BuildContext]
  String get timePickerMinuteModeAnnouncement =>
      materialLocalizations.timePickerMinuteModeAnnouncement;

  /// The [MaterialLocalizations.unspecifiedDate] of the current [BuildContext]
  String get unspecifiedDate => materialLocalizations.unspecifiedDate;

  /// The [MaterialLocalizations.unspecifiedDateRange] of the current [BuildContext]
  String get unspecifiedDateRange => materialLocalizations.unspecifiedDateRange;

  /// The [MaterialLocalizations.viewLicensesButtonLabel] of the current [BuildContext]
  String get viewLicensesButtonLabel =>
      materialLocalizations.viewLicensesButtonLabel;
}
