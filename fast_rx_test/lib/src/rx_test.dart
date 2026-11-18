import 'package:fast_rx/fast_rx.dart';
import 'package:meta/meta.dart';

/// A container for a [transform] on an [Rx] object
@immutable
class RxTest<T extends Rx> {
  /// A function to generate an [Rx] object. This is a function so that the
  /// test can be reused.
  final T Function() generate;

  /// A transformation to run on the generated [Rx] object
  final void Function(T rx) transform;

  /// The number of times the expected consequence should occur
  ///
  /// This is ignored for "shouldNot" tests
  final int count;

  /// Create an [RxTest]
  const RxTest(this.generate, this.transform, {this.count = 1});
}
