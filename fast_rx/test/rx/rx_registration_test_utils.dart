import 'package:fast_rx/src/rx/rx.dart';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:mockito/mockito.dart';
import '../rx_notifier_test.mocks.dart';

void testRegistration(Rx rx, List<void Function()> calls) {
  final notifier = MockRxNotifier();
  RxNotifier.instance = notifier;

  for (final call in calls) {
    call();
  }

  verify(notifier.addStream(rx.stream)).called(calls.length);
}
