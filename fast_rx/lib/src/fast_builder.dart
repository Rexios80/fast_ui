import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/material.dart';

/// A [StatefulWidget] that updates with it's observer
class FastBuilder extends StatefulWidget {
  /// A Widget builder containing reactive objects
  final ValueGetter<Widget> builder;

  /// Rebuild if the [condition] is true
  ///
  /// Defaults to always rebuild
  final ValueGetter<bool>? condition;

  /// A [FastBuilder] updates when reactive properties within change
  const FastBuilder(this.builder, {Key? key, this.condition}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FastBuilderState();
  }
}

class _FastBuilderState extends State<FastBuilder> {
  final _observer = RxObserver();

  @override
  void initState() {
    super.initState();
    _observer.listen(() {
      if (!mounted || !(widget.condition?.call() ?? true)) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RxNotifier.instance.setupObserver(_observer, widget.builder);
  }

  @override
  void dispose() {
    _observer.dispose();
    super.dispose();
  }
}
