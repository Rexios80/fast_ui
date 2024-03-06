import 'package:flutter/material.dart';

class _Injector {
  /// Get the closest injector of the current context
  static _Injector? of(BuildContext context) =>
      context.findAncestorStateOfType<_FastWidgetState>()?.widget._injector;

  /// If this injector will accept new registrations
  var _finalized = false;

  /// The instance registry
  final _registry = <Type, Object>{};

  /// Register the instance of type [T]
  /// 
  /// This will override any inherited registrations of [T]
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

  /// Merge with the parent [_Injector] if it exists
  void inheritRegistrations(BuildContext context) {
    if (_finalized) {
      throw Exception('Cannot merge with parent injector after `initState`');
    }

    final parentInjector = _Injector.of(context);
    if (parentInjector == null) return;

    for (final entry in parentInjector._registry.entries) {
      // Don't overwrite existing registrations
      if (_registry.containsKey(entry.key)) continue;
      _registry[entry.key] = entry.value;
    }

    _finalized = true;
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
}

abstract class FastStatefulWidget extends StatefulWidget with Injectable {
  /// Constructor
  FastStatefulWidget({super.key});

  @override
  FastState<Injectable> createState();
}

abstract class FastState<T extends Injectable> extends State<T> {
  @override
  void initState() {
    super.initState();
    widget._injector.inheritRegistrations(context);
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
