import 'package:fast_rx/fast_rx.dart';

/// Exception thrown when a FastBuilder contains no registrable values
class NoRxValuesInFastBuilder implements FastRxException {
  @override
  String toString() => 'No reactive values found in the given FastBuilder.'
      ' Rx values must be used in the root widget of a FastBuilder.';
}
