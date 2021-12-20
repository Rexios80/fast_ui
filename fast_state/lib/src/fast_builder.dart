import 'package:fast_state/src/rx_notifier.dart';
import 'package:flutter/material.dart';

/// A [StatefulWidget] that updates with it's observer
class FastBuilder extends StatefulWidget {
  /// A Widget builder containing Rx objects
  final Widget Function() builder;

  /// A [FastBuilder] updates when observable properties within change
  const FastBuilder(
    this.builder, {
    Key? key,
  }) : super(key: key);

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
    RxNotifier.setupObserver(_observer, widget.builder);
    _observer.listen(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder();
  }

  @override
  void dispose() {
    _observer.dispose();
    super.dispose();
  }
}
