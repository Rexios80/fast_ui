import 'package:fast_inject/fast_inject.dart';
import 'package:fast_inject_example/deps.dart';
import 'package:flutter/material.dart';

class Stateful extends FastStatefulWidget {
  late final dep3 = get<Dep3>();

  Stateful({super.key});

  @override
  FastState<Injectable> createState() => _StatefulState();
}

class _StatefulState extends FastState<Stateful> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () => setState(() => widget.dep3.count++),
          child: Text('Count: ${widget.dep3.count}'),
        ),
      ],
    );
  }
}
