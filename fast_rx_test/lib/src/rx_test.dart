// ignore_for_file: implementation_imports

import 'package:fast_rx/src/rx/rx.dart';

/// A container for a [transform] on [rx]
class RxTest<T extends Rx> {
  /// An optional id of the test for debugging
  final String? id;

  /// If true, print notification values to the console
  final bool verbose;

  /// The rx value
  final T rx;

  /// A transformation to run on [rx]
  final void Function(T rx) transform;

  /// Create an [RxTest]
  RxTest(this.rx, this.transform, {this.id, this.verbose = false});
}
