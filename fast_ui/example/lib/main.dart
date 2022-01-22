import 'package:device_preview/device_preview.dart';
import 'package:fast_ui/fast_ui.dart';
import 'package:fast_ui_example/examples/fast_extensions_example.dart';
import 'package:fast_ui_example/examples/fast_nav_example.dart';
import 'package:fast_ui_example/examples/fast_overlays_example.dart';
import 'package:fast_ui_example/examples/fast_rx_example.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FastUiExampleApp());
}

class FastUiExampleApp extends StatelessWidget {
  const FastUiExampleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DevicePreview(
      builder: (context) => MaterialApp(
        useInheritedMediaQuery: true,
        locale: DevicePreview.locale(context),
        builder: DevicePreview.appBuilder,
        // Initialize both FastNav and FastOverlays in one line
        navigatorKey:
            FastNav.init(FastOverlays.init(GlobalKey<NavigatorState>())),
        title: 'fast_ui Example',
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        home: const FastUiExample(),
      ),
    );
  }
}

class FastUiExample extends StatelessWidget {
  const FastUiExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('fast_ui Example')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('fast_rx Example'),
              onPressed: () => FastNav.push(FastRxExample()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('fast_nav Example'),
              onPressed: () => FastNav.push(const FastNavExample()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('fast_overlays Example'),
              onPressed: () => FastNav.push(const FastOverlaysExample()),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              child: const Text('fast_extensions Example'),
              onPressed: () => FastNav.push(const FastExtensionsExample()),
            ),
          ],
        ),
      ),
    );
  }
}
