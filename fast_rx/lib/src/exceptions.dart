/// An exception thrown by FastRx
abstract class FastRxException implements Exception {}

/// Exception thrown when attempting to set RxObject.value
class RxObjectValueIsReadOnly implements FastRxException {
  @override
  String toString() => 'RxObject.value is read-only.';
}

/// Exception thrown when attempting to call Rx.run with an async action
class RxRunActionWasAsync implements FastRxException {
  @override
  String toString() => 'Rx.run does not support async actions.';
}
