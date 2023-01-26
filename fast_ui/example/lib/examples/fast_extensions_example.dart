import 'package:fast_ui/fast_ui.dart';
import 'package:flutter/material.dart';

class FastExtensionsExample extends StatelessWidget {
  const FastExtensionsExample({super.key});

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
            Text('Headline Medium', style: context.textTheme.headlineMedium),
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
