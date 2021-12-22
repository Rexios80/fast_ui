import 'dart:async';

import 'package:collection/collection.dart';
import 'package:fast_rx/src/rx/rx.dart';
import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/foundation.dart';

/// A reactive map
class RxMap<K, V> extends DelegatingMap<K, V> implements Rx<Map<K, V>> {
  
}

/// Extension to allow creating reactive maps
extension RxMapExtension<K, V> on Map<K, V> {
  /// Create a reactive map
  RxMap<K, V> get rx => RxMap<K, V>(this);
}
