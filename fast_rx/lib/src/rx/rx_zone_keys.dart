/// String constants for zone values used by [Rx]
class RxZoneKeys {
  RxZoneKeys._();

  /// Key to tell if the code is running in an rx zone
  static const zonedKey = '_fast_rx_zoned_key';

  /// Key for the notifier callback in an rx zone
  static const notifierKey = '_fast_rx_notifier_key';
}
