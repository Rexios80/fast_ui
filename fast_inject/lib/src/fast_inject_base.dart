import 'package:flutter/material.dart';

class Injector {
  /// Get the injector of the current context
  static Injector? of(BuildContext context) =>
      context.findAncestorStateOfType<_FastWidgetState>()?.widget._injector;

  /// If this injector will accept new registrations
  ///
  /// Set to true after `initState` is called
  var finalized = false;

  /// The instance registry
  final registry = <Type, Object>{};

  /// Register the instance of type [T]
  void register<T>(T instance) {
    if (finalized) {
      throw Exception('Cannot register new instances after initState');
    }
    if (instance == null) {
      throw Exception('Instance cannot be null');
    } else if (registry.containsKey(T)) {
      throw Exception('Type $T is already registered in this context');
    }
    registry[T] = instance;
  }

  /// Get the registered instance of type [T]
  T get<T>() {
    final instance = registry[T] as T?;
    if (instance == null) {
      throw Exception('Type $T is not registered in this context');
    }
    return instance;
  }
}

/// Mixin base for injectable widgets
mixin Injectable on StatefulWidget {
  final _injector = Injector();

  /// Get an instance of type [T] from the injector
  ///
  /// Can only be used after `initState` is called
  T get<T>() => _injector.get<T>();

  /// Inject a dependency into this widget
  void inject<T>(T instance) => _injector.register(instance);
}

abstract class FastStatefulWidget extends StatefulWidget with Injectable {
  /// Constructor
  FastStatefulWidget({super.key});

  @override
  FastState<Injectable> createState();
}

abstract class FastWidget extends FastStatefulWidget {
  /// Constructor
  FastWidget({super.key});

  /// The build method
  Widget build(BuildContext context);

  @override
  FastState<Injectable> createState() => _FastWidgetState();
}

abstract class FastState<T extends Injectable> extends State<T> {
  @override
  void initState() {
    super.initState();

    final parentInjector = Injector.of(context);

    if (parentInjector != null) {
      widget._injector.registry.addAll(parentInjector.registry);
    }

    // Disallow further registrations
    widget._injector.finalized = true;
  }
}

class _FastWidgetState extends FastState<FastWidget> {
  @override
  Widget build(BuildContext context) => widget.build(context);
}
