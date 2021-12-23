fast_rx is a reactive state management solution for Flutter

Inspired by [GetX](https://pub.dev/packages/get), [observable_ish](https://pub.dev/packages/observable_ish), and similar packages

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

...

// Will print the value and trigger a rebuild of the FastBuilder
count.value = 1;
```

## Additional information
See [fast_ui](https://pub.dev/packages/fast_ui) for more information