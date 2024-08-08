import 'package:fast_rx/fast_rx.dart';
import 'package:fast_rx_test/fast_rx_test.dart';
import 'package:test/test.dart';

void main() {
  final shouldRegister = <RxTest<RxString>>[
    RxTest(() => 'a'.rx, (rx) => rx[0]),
    RxTest(() => 'a'.rx, (rx) => rx.codeUnitAt(0)),
    RxTest(() => 'a'.rx, (rx) => rx.length),
    RxTest(() => 'a'.rx, (rx) => rx.compareTo('')),
    RxTest(() => 'a'.rx, (rx) => rx.endsWith('')),
    RxTest(() => 'a'.rx, (rx) => rx.startsWith('')),
    RxTest(() => 'a'.rx, (rx) => rx.indexOf('')),
    RxTest(() => 'a'.rx, (rx) => rx.lastIndexOf('')),
    RxTest(() => 'a'.rx, (rx) => rx.isEmpty),
    RxTest(() => 'a'.rx, (rx) => rx.isNotEmpty),
    RxTest(() => 'a'.rx, (rx) => rx + ''),
    RxTest(() => 'a'.rx, (rx) => rx.substring(0)),
    RxTest(() => 'a'.rx, (rx) => rx.trim()),
    RxTest(() => 'a'.rx, (rx) => rx.trimLeft()),
    RxTest(() => 'a'.rx, (rx) => rx.trimRight()),
    RxTest(() => 'a'.rx, (rx) => rx * 1),
    RxTest(() => 'a'.rx, (rx) => rx.padLeft(1)),
    RxTest(() => 'a'.rx, (rx) => rx.padRight(1)),
    RxTest(() => 'a'.rx, (rx) => rx.contains('')),
    RxTest(() => 'a'.rx, (rx) => rx.replaceFirst('', '')),
    RxTest(() => 'a'.rx, (rx) => rx.replaceFirstMapped('', (_) => '')),
    RxTest(() => 'a'.rx, (rx) => rx.replaceAll('', '')),
    RxTest(() => 'a'.rx, (rx) => rx.replaceAllMapped('', (_) => '')),
    RxTest(() => 'a'.rx, (rx) => rx.replaceRange(0, 1, '')),
    RxTest(() => 'a'.rx, (rx) => rx.split('')),
    RxTest(() => 'a'.rx, (rx) => rx.splitMapJoin('', onMatch: (_) => '')),
    RxTest(() => 'a'.rx, (rx) => rx.codeUnits),
    RxTest(() => 'a'.rx, (rx) => rx.runes),
    RxTest(() => 'a'.rx, (rx) => rx.toLowerCase()),
    RxTest(() => 'a'.rx, (rx) => rx.toUpperCase()),
    RxTest(() => 'a'.rx, (rx) => rx.allMatches('')),
    RxTest(() => 'a'.rx, (rx) => rx.matchAsPrefix('')),
  ];

  test('RxString registration and notifications', () {
    expectRx(shouldRegister: shouldRegister);
  });

  test('RxString/string equivalency', () {
    final rx = 'a'.rx;
    expect(rx[0], rx.value[0]);
    expect(rx.codeUnitAt(0), rx.value.codeUnitAt(0));
    expect(rx.length, rx.value.length);
    expect(rx.compareTo(''), rx.value.compareTo(''));
    expect(rx.endsWith(''), rx.value.endsWith(''));
    expect(rx.startsWith(''), rx.value.startsWith(''));
    expect(rx.indexOf(''), rx.value.indexOf(''));
    expect(rx.lastIndexOf(''), rx.value.lastIndexOf(''));
    expect(rx.isEmpty, rx.value.isEmpty);
    expect(rx.isNotEmpty, rx.value.isNotEmpty);
    // This line tests the `+` operator
    // ignore: prefer_interpolation_to_compose_strings
    expect(rx + '', rx.value + '');
    expect(rx.substring(0), rx.value.substring(0));
    expect(rx.trim(), rx.value.trim());
    expect(rx.trimLeft(), rx.value.trimLeft());
    expect(rx.trimRight(), rx.value.trimRight());
    expect(rx * 1, rx.value * 1);
    expect(rx.padLeft(1), rx.value.padLeft(1));
    expect(rx.padRight(1), rx.value.padRight(1));
    expect(rx.contains(''), rx.value.contains(''));
    expect(rx.replaceFirst('', ''), rx.value.replaceFirst('', ''));
    expect(
      rx.replaceFirstMapped('', (_) => ''),
      rx.value.replaceFirstMapped('', (_) => ''),
    );
    expect(rx.replaceAll('', ''), rx.value.replaceAll('', ''));
    expect(
      rx.replaceAllMapped('', (_) => ''),
      rx.value.replaceAllMapped('', (_) => ''),
    );
    expect(rx.replaceRange(0, 1, ''), rx.value.replaceRange(0, 1, ''));
    expect(rx.split(''), rx.value.split(''));
    expect(
      rx.splitMapJoin('', onMatch: (_) => ''),
      rx.value.splitMapJoin('', onMatch: (_) => ''),
    );
    expect(rx.codeUnits, rx.value.codeUnits);
    expect(rx.runes, rx.value.runes);
    expect(rx.toLowerCase(), rx.value.toLowerCase());
    expect(rx.toUpperCase(), rx.value.toUpperCase());
    expect(rx.allMatches(''), rx.value.allMatches(''));
    expect(rx.matchAsPrefix(''), rx.value.matchAsPrefix(''));
  });
}
