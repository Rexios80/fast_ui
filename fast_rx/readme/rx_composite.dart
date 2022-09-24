import 'package:fast_rx/fast_rx.dart';

void example() {
  final compositeList = [0.rx].rx.composite;
  final compositeMap = {0: 1.rx}.rx.composite;
  final compositeSet = {0.rx}.rx.composite;

  // All of these will cause their parent to notify
  compositeList[0].value = 1;
  compositeMap[0]!.value = 1;
  compositeSet.first.value = 1;
}
