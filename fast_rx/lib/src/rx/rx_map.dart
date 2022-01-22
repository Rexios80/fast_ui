import 'package:fast_rx/src/rx/rx_object.dart';
import 'package:flutter/foundation.dart';

/// A reactive map
class RxMap<K, V> extends RxObject<Map<K, V>> implements Map<K, V> {
  /// Create a reactive map
  RxMap(Map<K, V> value) : super(value);

  @override
  Map<K, V> copyValue() => Map.from(value);

  @override
  bool shouldNotify(Map<K, V> oldValue) => !mapEquals(value, oldValue);

  @override
  V? operator [](Object? key) {
    return value[key];
  }

  @override
  void operator []=(K key, V value) {
    notifyIfChanged(() => this.value[key] = value);
  }

  @override
  void addAll(Map<K, V> other) {
    notifyIfChanged(() => value.addAll(other));
  }

  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) {
    notifyIfChanged(() => value.addEntries(newEntries));
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    return value.cast<RK, RV>();
  }

  @override
  void clear() {
    notifyIfChanged(() => value.clear());
  }

  @override
  bool containsKey(Object? key) {
    return value.containsKey(key);
  }

  @override
  bool containsValue(Object? value) {
    return this.value.containsValue(value);
  }

  @override
  Iterable<MapEntry<K, V>> get entries {
    return value.entries;
  }

  @override
  void forEach(void Function(K key, V value) action) {
    value.forEach(action);
  }

  @override
  bool get isEmpty {
    return value.isEmpty;
  }

  @override
  bool get isNotEmpty {
    return value.isNotEmpty;
  }

  @override
  Iterable<K> get keys {
    return value.keys;
  }

  @override
  int get length {
    return value.length;
  }

  @override
  Map<K2, V2> map<K2, V2>(MapEntry<K2, V2> Function(K key, V value) convert) {
    return value.map(convert);
  }

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    return notifyIfChanged(() => value.putIfAbsent(key, ifAbsent));
  }

  @override
  V? remove(Object? key) {
    return notifyIfChanged(() => value.remove(key));
  }

  @override
  void removeWhere(bool Function(K key, V value) test) {
    notifyIfChanged(() => value.removeWhere(test));
  }

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    return notifyIfChanged(() => value.update(key, update, ifAbsent: ifAbsent));
  }

  @override
  void updateAll(V Function(K key, V value) update) {
    notifyIfChanged(() => value.updateAll(update));
  }

  @override
  Iterable<V> get values {
    return value.values;
  }
}

/// Extension to allow creating reactive maps
extension RxMapExtension<K, V> on Map<K, V> {
  /// Create a reactive map
  RxMap<K, V> get rx => RxMap<K, V>(this);
}
