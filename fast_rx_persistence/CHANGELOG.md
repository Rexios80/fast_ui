## 0.2.2
- Upgrades `fast_rx`

## 0.2.1
- Upgrades `fast_rx`

## 0.2.0+1
- Updates documentation

## 0.2.0
- BREAKING: Replaces `decode` and `encode` parameters with a `converter` paramerter that takes a `FastRxPersistenceConverter`. The simplest migration is to pass in an `InlineConverter` with `fromStore` and `toStore` parameters.
- Adds `EnumStringConverter` and `EnumIntConverter` for convenience

## 0.1.5
- Updated `fast_rx` to 0.4.0

## 0.1.4
- Updated to work with `fast_rx` 0.3.0

## 0.1.3
- Renamed the Rx extension to match the rest of the package

## 0.1.2
- Removed unnecessary init check

## 0.1.1
- Version bump to rerun pana

## 0.1.0
- Initial release
