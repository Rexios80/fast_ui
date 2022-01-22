/// An object that will properly emit updates when calling notify
abstract class RxObject<T> {
  /// Copy the value for update emission
  T copyValue();

  /// Check if the value has changed
  bool shouldNotify(T otherValue);
}
