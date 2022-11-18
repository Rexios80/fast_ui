import 'package:fast_rx/src/rx/composite/rx_composite.dart';
import 'package:fast_rx/src/rx/object/rx_list.dart';
import 'package:fast_rx/src/rx/rx.dart';

/// Composite version of [RxList] that notifies when elements do
///
/// Note that keeping track of element streams is not free, and a lot of
/// operations are done multiple times
class RxCompositeList<E extends Rx> extends RxList<E>
    with RxCompositeMixin<Iterable<E>> {
  /// Constructor
  RxCompositeList([List<E>? value]) : super(value ?? []) {
    unregisteredValue.forEach(addRx);
  }

  @override
  void replaceAll(Iterable<E> elements) {
    unregisteredValue.forEach(removeRx);
    elements.forEach(addRx);
    super.replaceAll(elements);
  }

  @override
  void operator []=(int index, E value) {
    removeRx(unregisteredValue[index]);
    addRx(value);
    super[index] = value;
  }

  @override
  void add(E value) {
    addRx(value);
    super.add(value);
  }

  @override
  void addAll(Iterable<E> iterable) {
    iterable.forEach(addRx);
    super.addAll(iterable);
  }

  @override
  void clear() {
    unregisteredValue.forEach(removeRx);
    super.clear();
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) {
    unregisteredValue.sublist(start, end).forEach(removeRx);
    if (fillValue != null) {
      addRx(fillValue);
    }
    super.fillRange(start, end, fillValue);
  }

  @override
  void insert(int index, E element) {
    addRx(element);
    super.insert(index, element);
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    iterable.forEach(addRx);
    super.insertAll(index, iterable);
  }

  @override
  bool remove(Object? value) {
    final result = super.remove(value);
    if (result) {
      removeRx(value as E);
    }
    return result;
  }

  @override
  E removeAt(int index) {
    final result = super.removeAt(index);
    removeRx(result);
    return result;
  }

  @override
  E removeLast() {
    final result = super.removeLast();
    removeRx(result);
    return result;
  }

  @override
  void removeRange(int start, int end) {
    unregisteredValue.sublist(start, end).forEach(removeRx);
    super.removeRange(start, end);
  }

  @override
  void removeWhere(bool Function(E element) test) {
    unregisteredValue.where(test).forEach(removeRx);
    super.removeWhere(test);
  }

  @override
  void replaceRange(int start, int end, Iterable<E> replacements) {
    unregisteredValue.sublist(start, end).forEach(removeRx);
    replacements.forEach(addRx);
    super.replaceRange(start, end, replacements);
  }

  @override
  void retainWhere(bool Function(E element) test) {
    unregisteredValue.where((e) => !test(e)).forEach(removeRx);
    super.retainWhere(test);
  }

  @override
  void setAll(int index, Iterable<E> iterable) {
    unregisteredValue.sublist(index, index + iterable.length).forEach(removeRx);
    iterable.forEach(addRx);
    super.setAll(index, iterable);
  }

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    unregisteredValue.sublist(start, end).forEach(removeRx);
    iterable.skip(skipCount).take(end - start).forEach(addRx);
    super.setRange(start, end, iterable, skipCount);
  }
}

/// Extension to allow creating composite [RxList]s
extension RxCompositeListExtension<E extends Rx> on RxList<E> {
  /// Create a composite version of this [RxList]
  // ignore: invalid_use_of_protected_member
  RxCompositeList<E> get composite => RxCompositeList<E>(unregisteredValue);
}
