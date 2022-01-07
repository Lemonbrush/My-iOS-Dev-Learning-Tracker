# KVO

### Short example

```Swift
class Person: NSObject {
    @objc dynamic var name = "Tailor Swift"
}

class ViewController: UIViewController {
    
    @objc let somePerson = Person()
    
    var nameObservation: NSKeyValueObservation?

    override func viewDidLoad() {
        super.viewDidLoad()
       
        nameObservation = observe(\.somePerson.name, options: [.new, .old]) { (vc, change) in
            print(change.oldValue, " renamed to ", change.newValue)
        }
        
        somePerson.name = "Justin Bieber"
    }
}
```

- [Using Key-Value Observing in Swift](https://developer.apple.com/documentation/swift/cocoa_design_patterns/using_key-value_observing_in_swift)
- [What is key-value observing?](https://www.hackingwithswift.com/example-code/language/what-is-key-value-observing)