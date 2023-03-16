import 'package:fast_inject/fast_inject.dart';
import 'package:fast_inject_example/deps.dart';
import 'package:flutter/material.dart';

class Stateless extends FastWidget {
  late final dep1 = get<Dep1>();
  late final dep2 = get<Dep2>();

  Stateless({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: dep1.color, child: Text(dep2.text));
  }
}
