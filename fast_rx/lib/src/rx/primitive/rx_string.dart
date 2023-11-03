import 'package:fast_rx/fast_rx.dart';

/// A reactive [String]
class RxString extends RxValue<String> implements Comparable<String>, Pattern {
  /// Create a reactive [String]
  RxString(super.value);

  /// See the [String] documentation
  String operator [](int index) => value[index];

  /// See [String.codeUnitAt]
  int codeUnitAt(int index) => value.codeUnitAt(index);

  /// See [String.length]
  int get length => value.length;

  @override
  int compareTo(String other) => value.compareTo(other);

  /// See [String.endsWith]
  bool endsWith(String other) => value.endsWith(other);

  /// See [String.startsWith]
  bool startsWith(Pattern pattern, [int index = 0]) =>
      value.startsWith(pattern, index);

  /// See [String.indexOf]
  int indexOf(Pattern pattern, [int start = 0]) =>
      value.indexOf(pattern, start);

  /// See [String.lastIndexOf]
  int lastIndexOf(Pattern pattern, [int? start]) =>
      value.lastIndexOf(pattern, start);

  /// See [String.isEmpty]
  bool get isEmpty => value.isEmpty;

  /// See [String.isNotEmpty]
  bool get isNotEmpty => value.isNotEmpty;

  /// See the [String] documentation
  String operator +(String other) => value + other;

  /// See [String.substring]
  String substring(int start, [int? end]) => value.substring(start, end);

  /// See [String.trim]
  String trim() => value.trim();

  /// See [String.trimLeft]
  String trimLeft() => value.trimLeft();

  /// See [String.trimRight]
  String trimRight() => value.trimRight();

  /// See the [String] documentation
  String operator *(int times) => value * times;

  /// See [String.padLeft]
  String padLeft(int width, [String padding = ' ']) =>
      value.padLeft(width, padding);

  /// See [String.padRight]
  String padRight(int width, [String padding = ' ']) =>
      value.padRight(width, padding);

  /// See [String.contains]
  bool contains(Pattern other, [int startIndex = 0]) =>
      value.contains(other, startIndex);

  /// See [String.replaceFirst]
  String replaceFirst(Pattern from, String to, [int startIndex = 0]) =>
      value.replaceFirst(from, to, startIndex);

  /// See [String.replaceFirstMapped]
  String replaceFirstMapped(
    Pattern from,
    String Function(Match match) replace, [
    int startIndex = 0,
  ]) =>
      value.replaceFirstMapped(from, replace, startIndex);

  /// See [String.replaceAll]
  String replaceAll(Pattern from, String replace) =>
      value.replaceAll(from, replace);

  /// See [String.replaceAllMapped]
  String replaceAllMapped(Pattern from, String Function(Match match) replace) =>
      value.replaceAllMapped(from, replace);

  /// See [String.replaceRange]
  String replaceRange(int start, int? end, String replacement) =>
      value.replaceRange(start, end, replacement);

  /// See [String.split]
  List<String> split(Pattern pattern) => value.split(pattern);

  /// See [String.splitMapJoin]
  String splitMapJoin(
    Pattern pattern, {
    String Function(Match)? onMatch,
    String Function(String)? onNonMatch,
  }) =>
      value.splitMapJoin(pattern, onMatch: onMatch, onNonMatch: onNonMatch);

  /// See [String.codeUnits]
  List<int> get codeUnits => value.codeUnits;

  /// See [String.runes]
  Runes get runes => value.runes;

  /// See [String.toLowerCase]
  String toLowerCase() => value.toLowerCase();

  /// See [String.toUpperCase]
  String toUpperCase() => value.toUpperCase();

  @override
  Iterable<Match> allMatches(String string, [int start = 0]) =>
      value.allMatches(string, start);

  @override
  Match? matchAsPrefix(String string, [int start = 0]) =>
      value.matchAsPrefix(string, start);
}

/// Extension to allow creating reactive [String]s
extension RxStringExtension on String {
  /// Create a reactive [String]
  RxString get rx => RxString(this);
}
