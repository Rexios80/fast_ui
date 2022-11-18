import 'package:fast_rx/src/rx/composite/rx_composite.dart';
import 'package:fast_rx/src/rx/object/rx_set.dart';
import 'package:fast_rx/src/rx/rx.dart';

/// Composite version of [RxSet] that notifies when elements do
///
/// Note that keeping track of element streams is not free, and a lot of
/// operations are done multiple times
class RxCompositeSet<E extends Rx> extends RxSet<E>
    with RxCompositeMixin<Iterable<E>> {
  /// Constructor
  RxCompositeSet([Set<E>? value]) : super(value ?? {}) {
    unregisteredValue.forEach(addRx);
  }

  @override
  void replaceAll(Iterable<E> elements) {
    unregisteredValue.forEach(removeRx);
    elements.forEach(addRx);
    super.replaceAll(elements);
  }

  @override
  bool add(E value) {
    final result = super.add(value);
    if (result) addRx(value);
    return result;
  }

  @override
  void addAll(Iterable<E> elements) {
    elements.forEach(addRx);
    super.addAll(elements);
  }

  @override
  void clear() {
    unregisteredValue.forEach(removeRx);
    super.clear();
  }

  @override
  bool remove(Object? value) {
    final result = super.remove(value);
    if (result) removeRx(value as E);
    return result;
  }

  @override
  void removeAll(Iterable<Object?> elements) {
    elements.whereType<E>().forEach(removeRx);
    super.removeAll(elements);
  }

  @override
  void removeWhere(bool Function(E element) test) {
    unregisteredValue.where(test).forEach(removeRx);
    super.removeWhere(test);
  }

  @override
  void retainAll(Iterable<Object?> elements) {
    unregisteredValue.where((e) => !elements.contains(e)).forEach(removeRx);
    super.retainAll(elements);
  }

  @override
  void retainWhere(bool Function(E element) test) {
    unregisteredValue.where((e) => !test(e)).forEach(removeRx);
    super.retainWhere(test);
  }
}

/// Extension to allow creating composite [RxSet]s
extension RxCompositeSetExtension<E extends Rx> on RxSet<E> {
  /// Create a composite version of this [RxSet]
  // ignore: invalid_use_of_protected_member
  RxCompositeSet<E> get composite => RxCompositeSet<E>(unregisteredValue);
}
