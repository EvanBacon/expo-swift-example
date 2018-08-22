# expo-swift-example

Example of writing Swift modules in Expo

## How To

First detach your expo project with:
```sh 
exp detach
```

Then open your iOS project, and add a swift file. You will also need a `.m` file of the same name.

* `DemoModule.swift`
* `DemoModule.m`

You should have been prompted to add a bridging header.
To check to make sure your header is linked:
* Click on the project Icon (Blue icon on the top left)
* Click the **Build Settings** tab
* Go to the section **Swift Compiler - General**
  * The value for **Objective-C Bridging Header** should be `[project]/[project]-Bridging-Header.h`. 
  * Ex: `expo-swift-example/expo-swift-example-Bridging-Header.h`

In your bridging header, import React Native libraries:
```objc
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
```

Now in your swift file:
```swift
@objc(DemoModule)
class DemoModule: RCTEventEmitter {
    @objc func someMethod(_ input: String) -> Void {}
    override func supportedEvents() -> [String]! {
      return []
    }
    @objc override func constantsToExport() -> [AnyHashable : Any]! {
      return []
    }
}
```

In your `.m` file:
```objc
#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
@interface RCT_EXTERN_MODULE(DemoModule, NSObject)
RCT_EXTERN_METHOD(someMethod:(NSString *)input);
@end
```


And in JS:

```js
import { NativeModules } from 'react-native';
NativeModules.DemoModule.someMethod(input);
```
