# Memory management

### Avoid Strong Reference Cycles when Capturing self

If you need to capture self in a block, such as when defining a callback block, it’s important to consider the memory management implications.

Blocks maintain strong references to any captured objects, including self, which means that it’s easy to end up with a strong reference cycle if, for example, an object maintains a copy property for a block that captures self:

``` Objective-C
@interface XYZBlockKeeper : NSObject
@property (copy) void (^block)(void);
@end
@implementation XYZBlockKeeper
- (void)configureBlock {
    self.block = ^{
        [self doSomething];    // capturing a strong reference to self
                               // creates a strong reference cycle
    };
}
...
@end
```

The compiler will warn you for a simple example like this, but a more complex example might involve multiple strong references between objects to create the cycle, making it more difficult to diagnose.

To avoid this problem, it’s best practice to capture a weak reference to self, like this:

``` Objective-C
- (void)configureBlock {
    XYZBlockKeeper * __weak weakSelf = self;
    self.block = ^{
        [weakSelf doSomething];   // capture the weak reference
                                  // to avoid the reference cycle
    }
}
```

By capturing the weak pointer to self, the block won’t maintain a strong relationship back to the XYZBlockKeeper object. If that object is deallocated before the block is called, the weakSelf pointer will simply be set to nil.

### Sources
- [Working with Blocks](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/ProgrammingWithObjectiveC/WorkingwithBlocks/WorkingwithBlocks.html)