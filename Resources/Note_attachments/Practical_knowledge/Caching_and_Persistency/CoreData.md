# Core Data

|       OOP World       |    Core Data World    |    Database World    |
|:--------------------- |:---------------------:|:--------------------:|
|         Class         |        Entity         |         Table        |
|       Property        |      Attribute        |         Field        |

CRUD (Create, Read, Update, Destroy) is happening inside Context. You don't do all these actions directly to persistance container

CoreData is like Git where application is a working directory, Context is a staging area and container is a remote repository (kind of)

--- 

##### Create   
Specify data type to make a request like so

``` Swift
let request: NSFetchRequest<Item> = Item.fetchRequest()
``` 
and than try to fetch data like so

``` Swift
try context.fetch(request)
```

##### Read  
Read data by declaring objects with the same names like  

``` Swift
Item(context: context)
```

##### Update  
To update data just set value like that  

``` Swift
itemArray.setValue("Completed", forKey: "title")
```
##### Destroy
To delete data just remove it from context and save

``` Swift
context.delete(someSpecificItem)
```

--- 

### Query language
- [NSPredicate Cheatsheet](https://academy.realm.io/posts/nspredicate-cheatsheet/)
- [NSPredicate](https://nshipster.com/nspredicate/)

### Articles

- [Core Data Programming Guide (Apple)](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/index.html)
- [Core Data from Scratch: Concurrency](https://code.tutsplus.com/tutorials/core-data-from-scratch-concurrency--cms-22131)
- [Core Data Cheat Sheet for Swift iOS Developers](https://www.andrewcbancroft.com/2015/02/18/core-data-cheat-sheet-for-swift-ios-developers/)