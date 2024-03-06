import 'package:flutter/material.dart';

class _Injector {
  /// Get the closest injector of the current context
  static _Injector? of(BuildContext context) =>
      context.findAncestorStateOfType<_FastWidgetState>()?._injector;

  /// If this injector will accept new registrations
  var _finalized = false;

  /// The instance registry
  final _registry = <Type, Object>{};

  /// Register the instance of type [T]
  ///
  /// This will override any inherited dependencies of [T]
  void register<T extends Object>(T instance) {
    if (_finalized) {
      throw Exception('Cannot register new instances after `initState`');
    } else if (_registry.containsKey(T)) {
      throw Exception('Type $T is already registered in this context');
    }
    _registry[T] = instance;
  }

  /// Get the registered instance of type [T]
  T get<T extends Object>() {
    final instance = _registry[T] as T?;
    if (instance == null) {
      throw Exception('Type $T is not registered in this context');
    }
    return instance;
  }

  /// Inherit all dependencies from the given [BuildContext] or [Injectable].
  /// Only one of [context] or [injectable] may be provided.
  ///
  /// Will not override any existing dependencies
  void inheritDependencies({
    BuildContext? context,
    Injectable? injectable,
    bool finalize = true,
  }) {
    assert(
      (context != null) ^ (injectable != null),
      'Provide only one of context or injectable',
    );

    if (_finalized) {
      throw Exception('Cannot inherit dependencies after `initState`');
    }

    final entries = <MapEntry<Type, Object>>[];

    if (context != null) {
      final parentInjector = _Injector.of(context);
      if (parentInjector != null) {
        entries.addAll(parentInjector._registry.entries);
      }
    }

    if (injectable != null) {
      entries.addAll(injectable._injector._registry.entries);
    }

    for (final entry in entries) {
      // Don't overwrite existing dependencies
      if (_registry.containsKey(entry.key)) continue;
      _registry[entry.key] = entry.value;
    }

    if (finalize) {
      _finalized = true;
    }
  }
}

/// Mixin base for injectable widgets
mixin Injectable on StatefulWidget {
  final _injector = _Injector();

  /// Get an instance of type [T] from the injector
  T get<T extends Object>() => _injector.get<T>();

  /// Inject a dependency into this widget
  ///
  /// This will override any inherited instances of [T]
  void inject<T extends Object>(T instance) => _injector.register(instance);

  /// Inherit all dependencies from the given [BuildContext] or [Injectable].
  /// Only one of [context] or [injectable] may be provided.
  ///
  /// Will not override any existing dependencies
  void inheritDependencies<T extends Injectable>({
    BuildContext? context,
    Injectable? injectable,
  }) =>
      _injector.inheritDependencies(
        context: context,
        injectable: injectable,
        finalize: false,
      );
}

abstract class FastStatefulWidget extends StatefulWidget with Injectable {
  /// Constructor
  FastStatefulWidget({super.key});

  @override
  FastState<Injectable> createState();
}

abstract class FastState<T extends Injectable> extends State<T> {
  late final _injector = _Injector()..inheritDependencies(injectable: widget);

  @override
  void initState() {
    super.initState();
    widget.inheritDependencies(context: context);
  }
}

abstract class FastWidget extends FastStatefulWidget {
  /// Constructor
  FastWidget({super.key});

  /// The build method
  Widget build(BuildContext context);

  @override
  FastState<Injectable> createState() => _FastWidgetState();
}

class _FastWidgetState extends FastState<FastWidget> {
  @override
  Widget build(BuildContext context) => widget.build(context);
}
