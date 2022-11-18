import 'package:fast_rx/fast_rx.dart';

class Composite extends RxComposite {
  final a = 1.rx;
  final b = 2.rx;
  final c = 3.rx;

  Composite() {
    // Register all rx fields so that this object notifies with them
    addRx(a);
    addRx(b);
    addRx(c);
  }
}
