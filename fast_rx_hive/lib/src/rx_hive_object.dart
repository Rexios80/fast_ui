import 'package:fast_rx/fast_rx.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class RxHiveObject<T> extends RxObject<T> with HiveObjectMixin {
  /// Constructor
  RxHiveObject(super.initialValue) {
    stream.listen((_) => save());
  }
}
