import 'dart:async';

/// Key for the registrar in an rx zone
const _registrarKey = '_fast_rx_registrar_key';

/// Key for the notifier in an rx zone
const _notifierKey = '_fast_rx_notifier_key';

/// An rx action to run in an rx zone
typedef RxAction<R> = R Function();

/// An rx registrar for an rx zone
typedef RxRegistrar = void Function(Stream stream);

/// An rx notifier for an rx zone
typedef RxNotifier = void Function(int id);

/// Run [action] in an rx zone
///
/// Will call [notifier] if a notification is attempted within this zone.
/// Will call [registrar] if a stream is registered within this zone.
R runRxZoned<R>(
  RxAction<R> action, {
  RxRegistrar? registrar,
  RxNotifier? notifier,
}) {
  return runZoned(
    action,
    zoneValues: {
      _registrarKey: registrar,
      _notifierKey: notifier,
    },
  );
}

/// Convenience class to get the [RxRegistrar] and [RxNotifier] of the current
/// [Zone] if they exist
class RxZone {
  /// This zone's registrar
  final RxRegistrar? registrar;

  /// This zone's notifier
  final RxNotifier? notifier;

  /// Constructor
  RxZone._({
    this.registrar,
    this.notifier,
  });

  /// Get information about the current [RxZone] if it exists
  static RxZone get current => RxZone._(
        registrar: Zone.current[_registrarKey] as RxRegistrar?,
        notifier: Zone.current[_notifierKey] as RxNotifier?,
      );
}
