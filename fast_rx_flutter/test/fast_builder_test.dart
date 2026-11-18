import 'package:fast_rx_flutter/fast_rx_flutter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FastBuilder', (tester) async {
    final reactive = 0.rx;
    await tester.pumpWidget(
      FastBuilder(
        () => Directionality(
          textDirection: TextDirection.ltr,
          child: Text('${reactive.value}'),
        ),
      ),
    );
    expect(find.text('0'), findsOneWidget);
    reactive.value = 1;
    // Notifications are async. Elapsing lets the rebuild land in this frame
    // when no other frame is already scheduled.
    await tester.pump(Duration.zero);
    expect(find.text('1'), findsOneWidget);
  });
}
