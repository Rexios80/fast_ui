/// Convert a value to/from a [FastRxPersistenceInterface]
/// - [T] is the type of the value read from the store
/// - [I] is the type of the value written to the store
abstract class FastRxPersistenceConverter<T, I> {
  /// Constructor
  const FastRxPersistenceConverter();

  /// Convert the value read from the store
  T fromStore(I value);

  /// Convert the value written to the store
  I toStore(T value);
}

/// Conveniently create a [FastRxPersistenceConverter] inline
class InlineConverter<T, I> extends FastRxPersistenceConverter<T, I> {
  /// Constructor
  /// - [fromStore]: Convert the value read from the store
  /// - [toStore]: Convert the value written to the store
  const InlineConverter({
    required T Function(I value) fromStore,
    required I Function(T value) toStore,
  })  : _fromStoreInline = fromStore,
        _toStoreInline = toStore;

  final T Function(I value) _fromStoreInline;
  final I Function(T value) _toStoreInline;

  @override
  T fromStore(I value) => _fromStoreInline(value);

  @override
  I toStore(T value) => _toStoreInline(value);
}

/// Converter between [Enum] and [I]
abstract class EnumConverter<T extends Enum, I>
    extends FastRxPersistenceConverter<T, I> {
  /// Constructor
  const EnumConverter(this.values);

  /// Then enum values
  final List<T> values;
}

/// Converter between [Enum] and [String]
class EnumStringConverter<T extends Enum> extends EnumConverter<T, String> {
  /// Constructor
  const EnumStringConverter(super.values);

  @override
  T fromStore(String value) => values.byName(value);

  @override
  String toStore(T value) => value.name;
}

/// Converter between [Enum] and [int]
class EnumIntConverter<T extends Enum> extends EnumConverter<T, int> {
  /// Constructor
  const EnumIntConverter(super.values);

  @override
  T fromStore(int value) => values[value];

  @override
  int toStore(T value) => value.index;
}
