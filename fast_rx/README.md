fast_rx is a reactive state management solution for Flutter

Inspired by [GetX](https://pub.dev/packages/get), [observable_ish](https://pub.dev/packages/observable_ish), and similar packages

[![pub package](https://img.shields.io/pub/v/fast_rx.svg?label=fast_rx)](https://pub.dev/packages/fast_rx)
[![codecov](https://codecov.io/gh/Rexios80/fast_ui/branch/master/graph/badge.svg?flag=project-fast_rx)](https://codecov.io/gh/Rexios80/fast_ui)
![checks](https://img.shields.io/github/checks-status/Rexios80/fast_ui/master)
[![popularity](https://badges.bar/fast_rx/popularity)](https://pub.dev/packages/fast_rx/score)
[![likes](https://badges.bar/fast_rx/likes)](https://pub.dev/packages/fast_rx/score)
[![pub points](https://badges.bar/fast_rx/pub%20points)](https://pub.dev/packages/fast_rx/score)

## Features
| Class       | Use-case                                    |
| ----------- | ------------------------------------------- |
| FastBuilder | Rebuilds when reactive values within change |
| RxValue<T>  | A reactive value                            |
| RxList<E>   | A reactive list                             |
| RxMap<E>    | A reactive map                              |
| RxSet<E>    | A reactive set                              |

There are convenience typedefs for RxBool, RxInt, RxDouble, and RxString

## Usage
```dart
import 'package:fast_rx/fast_rx.dart';

...

final count = 0.rx;

...

count.stream.listen((value) => print(value));

...

FastBuilder(() => Text('$count'));
FastBuilder(
  () => Text('$count'),
  condition: () => true,
),
...

// Will print the value and trigger a rebuild of FastBuilders
count.value = 1;
```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information