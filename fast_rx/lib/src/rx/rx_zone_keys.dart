import 'dart:async';

/// Key to tell if the code is running in an rx zone
const zonedKey = '_fast_rx_zoned_key';

/// Key for the notifier callback in an rx zone
const notifierKey = '_fast_rx_notifier_key';

/// Run [action] in an rx zone
/// 
/// Will call [notifier] if a notification is attempted within this zone
runRxZoned(void Function() action, {required void Function(int id) notifier}) {
  return runZoned(
    action,
    zoneValues: {
      zonedKey: true,
      notifierKey: notifier,
    },
  );
}
