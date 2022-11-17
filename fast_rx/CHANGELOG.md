## 0.3.1
- Removes the `RxNotifier` and uses `runRxZoned` for registration instead

## 0.3.0
- Adds `RxComposite` to allow for composition of `Rx` objects
- Adds `RxCompositeList`, `RxCompositeSet`, and `RxCompositeMap`
- Adds `composite` extension on `RxIterable<Rx>`s to create composite versions of them
- `Rx.value` field moved to `RxValue.value`
- `RxObject` now extends `RxValue`
- `RxValue ==` now behaves as expected
- Removes `Rx.close`
- A bunch of refactoring

## 0.2.10
- Fixes an edge case where registration could occur outside of a `FastBuilder` builder

## 0.2.9
- Safer zoned key string

## 0.2.8
- Adds `Rx.run` for performing multiple transformations with only one notification
- Adds `Rx.close` method for testing

## 0.2.7
- Added internal RxObject.value setter for use in Rx extensions

## 0.2.6
- Export rx.dart to allow for custom extensions in other packages

## 0.2.5
- Fixed notifications for `RxList[x] = value`
- Improved tests to make bugs like that less likely to happen in the future
- Added `replaceAll` convenience method to `RxList`, `RxSet`, and `RxMap`

## 0.2.4
- Added missing annotations

## 0.2.3
- Depend on fast_rx_test from pub

## 0.2.2
- Fixed RxList, RxMap, and RxSet being unmodifiable

## 0.2.1
- Added mockito to dev dependencies

## 0.2.0
- RxList, RxMap, and RxSet no longer require an initial value to be passed in to the constructor
- Moved testing utilities to fast_rx_test

## 0.1.3
- Named exceptions

## 0.1.2
- Updated documentation

## 0.1.1
- Updated license
- Updated documentation
- Use unregisteredValue for RxObject methods that do not return a value
- Added expectRxRegistration for testing RxObject registration
- Updated tests

## 0.1.0
- Full test coverage
- Updated documentation
- Added RxObject and cleaned up iterable implementations
- Prevented unnecessary registration

## 0.0.4
- Added conditional rebuild

## 0.0.3
- Decreased Dart version constraint

## 0.0.2
- Updated readme

## 0.0.1
- Initial release
