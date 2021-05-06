# Value vs Reference type

**Use a value type when:**  
- Comparing instance data with **==** makes sense  
- You want copies to have independent state  
- The data will be used in code across multiple threads  

**Use a reference type (e.g. use a class) when:**  
- Comparing instance identity with **===** makes sense  
- You want to create shared, mutable state  

### Articles
- [Apple blog: Value and Reference Types](https://developer.apple.com/swift/blog/?id=10)
- [Value and Reference Types](https://raquo.net/2014/09/value-and-reference-types/)