import 'package:fast_overlays/fast_overlays.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: FastOverlays.init(GlobalKey<NavigatorState>()),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
        title: const Text('fast_overlays_example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Snackbar'),
              onPressed: () {
                FastOverlays.showSnackBar(
                  const SnackBar(content: Text('I am a snackbar')),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Material Banner'),
              onPressed: () {
                FastOverlays.showMaterialBanner(
                  MaterialBanner(
                    content: const Text('I am a material banner'),
                    actions: [
                      TextButton(
                        child: const Text('Close'),
                        onPressed: () =>
                            FastOverlays.hideCurrentMaterialBanner(),
                      ),
                    ],
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Dialog'),
              onPressed: () {
                FastOverlays.showDialog(
                  builder: (context) => const AlertDialog(
                    title: Text('I am a dialog'),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Bottom Sheet'),
              onPressed: () {
                FastOverlays.showBottomSheet(
                  builder: (context) => const Text('I am a bottom sheet'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
