import 'package:fast_inject/fast_inject.dart';
import 'package:fast_inject_example/deps.dart';
import 'package:flutter/material.dart';

class Nested extends FastWidget {
  Nested({super.key});

  @override
  Widget build(BuildContext context) => Level2()..inject(Dep1());
}

class Level2 extends FastWidget {
  Level2({super.key});

  @override
  Widget build(BuildContext context) => Level3()..inject(Dep2());
}

class Level3 extends FastWidget {
  late final dep1 = get<Dep1>();
  late final dep2 = get<Dep2>();

  Level3({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(color: dep1.color, child: Text(dep2.text));
  }
}
