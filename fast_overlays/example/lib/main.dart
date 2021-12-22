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
      scaffoldMessengerKey:
          FastOverlays.init(GlobalKey<ScaffoldMessengerState>()),
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
            RaisedButton(
              child: const Text('show snackbar'),
              onPressed: () {
                FastOverlays.showSnackbar(
                  context,
                  const SnackBar(
                    content: Text('Hello World!'),
                  ),
                );
              },
            ),
            RaisedButton(
              child: const Text('show dialog'),
              onPressed: () {
                FastOverlays.showDialog(
                  context,
                  const AlertDialog(
                    title: Text('Hello World!'),
                  ),
                );
              },
            ),
            RaisedButton(
              child: const Text('show bottom sheet'),
              onPressed: () {
                FastOverlays.showBottomSheet(
                  context,
                  const BottomSheet(
                    content: Text('Hello World!'),
                  ),
                );
              },
            ),
          ],
          ],
        ),
      ),
    );
  }
}
