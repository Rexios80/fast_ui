import 'package:fast_rx/fast_rx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('FastBuilder', (WidgetTester tester) async {
    final reactive = 0.rx;
    await tester.pumpWidget(
      FastBuilder(
        () => MaterialApp(home: Scaffold(body: Text('${reactive.value}'))),
      ),
    );
    expect(find.text('0'), findsOneWidget);
    reactive.value = 1;
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
