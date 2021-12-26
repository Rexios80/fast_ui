import 'package:flutter/material.dart';
import 'package:fast_extensions/fast_extensions.dart';

class ExampleWidget extends StatelessWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('TextTheme example', style: context.textTheme.headline4),
    );
  }
}
