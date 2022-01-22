import 'package:flutter/material.dart';
import 'package:fast_extensions/fast_extensions.dart';

class FastExtensionsExample extends StatelessWidget {
  const FastExtensionsExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fast_extensions Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Headline 4', style: context.textTheme.headline4),
            Text('Back button tooltip: ${context.backButtonTooltip}'),
            Text('Country code: ${context.countryCode}'),
            Text('Language code: ${context.languageCode}'),
            Text('Is dark mode: ${context.isDarkMode}'),
            Text('Screen width: ${context.screenWidth}'),
            Text('Screen height: ${context.screenHeight}'),
          ],
        ),
      ),
    );
  }
}
