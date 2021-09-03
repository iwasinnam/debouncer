# debouncer
Easily debounce methods in Swift

Example:
```
lazy var sendAppContext = Debounced(interval: TimeInterval(5.0)) { [weak self] in
    guard let self = self else { return }

    //....
}
```
