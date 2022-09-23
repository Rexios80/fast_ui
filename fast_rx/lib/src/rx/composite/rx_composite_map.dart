import 'package:fast_rx/src/rx/composite/rx_composite.dart';
import 'package:fast_rx/src/rx/object/rx_map.dart';
import 'package:fast_rx/src/rx/rx.dart';

/// Composite version of [RxMap] that notifies when elements do
///
/// Note that keeping track of element streams is not free, and a lot of
/// operations are done multiple times
class RxCompositeMap<K, V extends Rx> extends RxMap<K, V>
    with RxCompositeMixin<Map<K, V>> {
  /// Constructor
  RxCompositeMap([Map<K, V>? value]) : super(value ?? {}) {
    unregisteredValue.values.forEach(addRx);
  }

  @override
  void replaceAll(Map<K, V> elements) {
    unregisteredValue.values.forEach(removeRx);
    elements.values.forEach(addRx);
    super.replaceAll(elements);
  }

  @override
  void operator []=(K key, V value) {
    final oldValue = unregisteredValue[key];
    if (oldValue != null) {
      removeRx(oldValue);
    }
    addRx(value);
    super[key] = value;
  }

  @override
  void addAll(Map<K, V> other) {
    other.keys
        .map((e) => unregisteredValue[e])
        .whereType<V>()
        .forEach(removeRx);
    other.values.forEach(addRx);
    super.addAll(other);
  }

  @override
  void clear() {
    unregisteredValue.values.forEach(removeRx);
    super.clear();
  }

  @override
  V putIfAbsent(K key, V Function() ifAbsent) {
    final result = super.putIfAbsent(key, ifAbsent);
    addRx(result);
    return result;
  }

  @override
  V? remove(Object? key) {
    final result = super.remove(key);
    if (result != null) {
      removeRx(result);
    }
    return result;
  }

  @override
  void removeWhere(bool Function(K key, V value) test) {
    unregisteredValue.entries
        .where((e) => test(e.key, e.value))
        .map((e) => e.value)
        .forEach(removeRx);
    super.removeWhere(test);
  }

  @override
  V update(K key, V Function(V value) update, {V Function()? ifAbsent}) {
    final oldValue = unregisteredValue[key];
    if (oldValue != null) {
      removeRx(oldValue);
    }
    final result = super.update(key, update, ifAbsent: ifAbsent);
    addRx(result);
    return result;
  }

  @override
  void updateAll(V Function(K key, V value) update) {
    unregisteredValue.values.forEach(removeRx);
    super.updateAll(update);
    unregisteredValue.values.forEach(addRx);
  }
}

/// Extension to allow creating composite [RxMap]s
extension RxCompositeMapExtension<K, V extends Rx> on RxMap<K, V> {
  /// Create a composite version of this [RxList]
  // ignore: invalid_use_of_protected_member
  RxCompositeMap<K, V> get composite => RxCompositeMap<K, V>(unregisteredValue);
}
