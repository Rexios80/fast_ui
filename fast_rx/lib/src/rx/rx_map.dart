import 'package:fast_rx/src/rx/rx.dart';
import 'package:flutter/foundation.dart';

/// A reactive map
class RxMap<K, V> with Rx<Map<K, V>> implements Map<K, V> {
  final Map<K, V> _value;

  /// Create a reactive map
  RxMap(this._value);

  @protected
  @override
  Map<K, V> get value {
    register();
    return _value;
  }

  /// Unused for RxMap
  @protected
  @override
  set value(Map<K, V> value) {
    throw UnimplementedError('Cannot set value of RxMap');
  }

  @override
  void notify() {
    notifyWithValue(Map.from(value));
  }

  @override
  V? operator [](Object? key) {
    return value[key];
  }

  @override
  void operator []=(K key, V value) {
    final old = Map<K, V>.from(this.value);
    this.value[key] = value;
    notifyIfChanged(old);
  }

  @override
  void addAll(Map<K, V> other) {
    final old = Map<K, V>.from(value);
    value.addAll(other);
    notifyIfChanged(old);
  }

  @override
  void addEntries(Iterable<MapEntry<K, V>> newEntries) {
    final old = Map<K, V>.from(value);
    value.addEntries(newEntries);
    notifyIfChanged(old);
  }

  @override
  Map<RK, RV> cast<RK, RV>() {
    return value.cast<RK, RV>();
  }

  @override
  void clear() {
    final old = Map<K, V>.from(value);
    value.clear();
    notifyIfChanged(old);
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
    final old = Map<K, V>.from(value);
    final v = value.putIfAbsent(key, ifAbsent);
    notifyIfChanged(old);
    return v;
  }

  @override
  V? remove(Object? key) {
    final old = Map<K, V>.from(value);
    final v = value.remove(key);
    notifyIfChanged(old);
    return v;
  }

  @override
  void removeWhere(bool Function(K key, V value) test) {
    final old = Map<K, V>.from(value);
    value.removeWhere(test);
    notifyIfChanged(old);
  }

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    final old = Map<K, V>.from(value);
    final v = value.update(key, update, ifAbsent: ifAbsent);
    notifyIfChanged(old);
    return v;
  }

  @override
  void updateAll(V Function(K key, V value) update) {
    final old = Map<K, V>.from(value);
    value.updateAll(update);
    notifyIfChanged(old);
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
