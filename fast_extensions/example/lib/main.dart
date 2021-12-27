import 'package:flutter/material.dart';
import 'package:fast_extensions/fast_extensions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('fast_extensions_example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Back button tooltip: ${context.backButtonTooltip}',
              style: context.textTheme.headline4,
            ),
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
