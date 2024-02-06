/// Convert a value to/from a [FastRxPersistenceInterface]
/// - [T] is the type of the value outside the store
/// - [I] is the type of the value inside the store
abstract class PersistenceConverter<T, I> {
  /// Constructor
  const PersistenceConverter();

  /// Convert the value read from the store
  T fromStore(I value);

  /// Convert the value written to the store
  I toStore(T value);

  /// Conveniently create a [PersistenceConverter] inline
  factory PersistenceConverter.inline({
    required T Function(I value) fromStore,
    required I Function(T value) toStore,
  }) =>
      _InlinePersistenceConverter(fromStore: fromStore, toStore: toStore);
}

/// Conveniently create a [PersistenceConverter] inline
class _InlinePersistenceConverter<T, I> extends PersistenceConverter<T, I> {
  /// Constructor
  /// - [fromStore]: Convert the value read from the store
  /// - [toStore]: Convert the value written to the store
  const _InlinePersistenceConverter({
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
abstract class EnumPersistenceConverter<T extends Enum, I>
    extends PersistenceConverter<T, I> {
  /// Constructor
  const EnumPersistenceConverter(this.values);

  /// Then enum values
  final List<T> values;

  /// A string [EnumPersistenceConverter]
  static EnumPersistenceConverter<T, String> string<T extends Enum>(
    List<T> values,
  ) =>
      _StringEnumPersistenceConverter(values);

  /// An int [EnumPersistenceConverter]
  static EnumPersistenceConverter<T, int> integer<T extends Enum>(
    List<T> values,
  ) =>
      _IntEnumPersistenceConverter(values);
}

/// Converter between [Enum] and [String]
class _StringEnumPersistenceConverter<T extends Enum>
    extends EnumPersistenceConverter<T, String> {
  /// Constructor
  const _StringEnumPersistenceConverter(super.values);

  @override
  T fromStore(String value) => values.byName(value);

  @override
  String toStore(T value) => value.name;
}

/// Converter between [Enum] and [int]
class _IntEnumPersistenceConverter<T extends Enum>
    extends EnumPersistenceConverter<T, int> {
  /// Constructor
  const _IntEnumPersistenceConverter(super.values);

  @override
  T fromStore(int value) => values[value];

  @override
  int toStore(T value) => value.index;
}
