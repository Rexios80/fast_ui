/// An exception thrown by FastRx
abstract class FastRxException implements Exception {}

/// Exception thrown when a FastBuilder contains no registrable values
class NoRxValuesInFastBuilder implements FastRxException {
  @override
  String toString() => 'No reactive values found in the given FastBuilder.'
      ' Rx values must be used in the root widget of a FastBuilder.';
}

/// Exception thrown when attemptin to set RxObject.value
class RxObjectValueIsReadOnly implements FastRxException {
  @override
  String toString() => 'RxObject.value is read-only.';
}
