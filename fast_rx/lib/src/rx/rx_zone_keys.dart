import 'dart:async';

/// Key to tell if the code is running in an rx zone
const zonedKey = '_fast_rx_zoned_key';

/// Key for the notifier callback in an rx zone
const notifierKey = '_fast_rx_notifier_key';

runRxZoned(void Function() body, {required void Function(int id) notifier}) {
  return runZoned(
    body,
    zoneValues: {
      zonedKey: true,
      notifierKey: notifier,
    },
  );
}
