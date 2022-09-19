// Mocks generated by Mockito 5.3.1 from annotations
// in fast_rx_test/src/fast_rx_testing.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i3;

import 'package:fast_rx/src/rx_notifier.dart' as _i2;
import 'package:fast_rx_test/src/fast_rx_testing.dart' as _i5;
import 'package:flutter/foundation.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

/// A class which mocks [RxNotifier].
///
/// See the documentation for Mockito's code generation for more information.
class MockRxNotifier extends _i1.Mock implements _i2.RxNotifier {
  MockRxNotifier() {
    _i1.throwOnMissingStub(this);
  }

  @override
  void addStream(_i3.Stream<dynamic>? stream) => super.noSuchMethod(
        Invocation.method(
          #addStream,
          [stream],
        ),
        returnValueForMissingStub: null,
      );
  @override
  T setupObserver<T>(
    _i2.RxObserver? observer,
    _i4.ValueGetter<T>? builder,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setupObserver,
          [
            observer,
            builder,
          ],
        ),
        returnValue: _i5.setupObserverShim<T>(
          observer,
          builder,
        ),
      ) as T);
}
