# debouncer
Easily debounce methods in Swift

Create:
```
// Regardless how many time this method is called, it will be executed at most once in 5 seconds
lazy var sendAppContext = Debounced(interval: TimeInterval(5.0)) { [weak self] in
    guard let self = self else { return }

    //....
}
```

Use:
```
self.sendAppContext()
```
