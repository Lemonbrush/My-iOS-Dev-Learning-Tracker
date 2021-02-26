# [Cocoapods](https://cocoapods.org)

CocoaPods is a dependency manager for Swift and Objective-C Cocoa projects. It has over 80 thousand libraries and is used in over 3 million apps. CocoaPods can help you scale your projects elegantly.  

### Articles

- [CocoaPods Tutorial for Swift: Getting Started](https://www.raywenderlich.com/7076593-cocoapods-tutorial-for-swift-getting-started)

### Instalation 

`sudo gem install cocoapods`

### How to install and use

`cd *your project directory*` - Go to the directory  

`pod init` - Make a podfile in the directory  

**Podfile map**

``` Ruby

# Minimal iOS version
platform :ios, '9.0'

target 'Flash Chat' do
  use_frameworks!
  
  # Here should be listed pods for Flash Chat

  pod 'CLTypingLabel', '~> 0.4.0'

end
```  

`pod install` - Install all the pods listed in the podfile  

`pod update` - autoatically fetch all installed pods latest versions 

### How to uninsall

just remove the pod line and install the pod file again

