## 0.4.2
- Upgrades `fast_rx`

## 0.4.1
- Upgrades `fast_rx`

## 0.4.0
- Uses `runRxZoned` for registration testing as well
- Removes dependency on `RxNotifier`
- Combines `expectRxRegistration` and `expectRxNotification` into `expectRx`

## 0.3.2
- Much more reliable `expectRxNotification` verification using `runRxZoned`
- Adds `RxComposite` support to `expectRxNotification`

## 0.3.1
- Documentation fixes

## 0.3.0
- `RxTest` now takes an Rx generator function so that tests can be reused
- `expectRxNotification` improvements
- `shouldNotify` and `shouldRegister` fields are now optional

## 0.2.0
- Made tests much more convenient to write
- Added expectRxNotification

## 0.1.1
- Fixed dart version constraint to work with pub pana

## 0.1.0
- Initial release