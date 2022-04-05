import 'package:test/test.dart';

/// Expect that every call in [calls] transforms [rx] and [base] such that
/// [test] returns true
expectRxObjectValueParity<T>(
  T rx, {
  required T base,
  required bool Function(T, T) test,
  required List<Function(T)> calls,
}) {
  for (final call in calls) {
    call(rx);
    call(base);

    expect(test(rx, base), isTrue);
  }
}
