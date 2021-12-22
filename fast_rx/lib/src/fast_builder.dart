import 'package:fast_rx/src/rx_notifier.dart';
import 'package:flutter/material.dart';

/// A [StatefulWidget] that updates with it's observer
class FastBuilder extends StatefulWidget {
  /// A Widget builder containing reactive objects
  final Widget Function() builder;

  /// A [FastBuilder] updates when reactive properties within change
  const FastBuilder({
    Key? key,
    required this.builder,
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
    _observer.listen(() {
      if (!mounted) return;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return RxNotifier.setupObserver(_observer, widget.builder);
  }

  @override
  void dispose() {
    _observer.dispose();
    super.dispose();
  }
}
