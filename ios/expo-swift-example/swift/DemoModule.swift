//
//  DemoModule.swift
//  expo-swift-example
//
//  Created by Evan Bacon on 8/22/18.
//  Copyright © 2018 650 Industries, Inc. All rights reserved.
//

import Foundation

fileprivate struct Events {
    static let demoCallback = "DemoModule.demoCallback"
}

@objc(DemoModule)
class DemoModule: RCTEventEmitter {
    
    // Remember the underscore for the first prop.
    // In Objective-C we would pass in resolver: and use it as resolve. Here we pass in resolve: and use it as resolve:
    @objc func someMethod(_ input: String, resolve: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
        resolve("Swift + " + input);
        sendEvent(withName: Events.demoCallback, body: [
            "message": "Message from Swift!"
            ]);
    }
    
    override func supportedEvents() -> [String]! {
        return [Events.demoCallback]
    }
    
    @objc override func constantsToExport() -> [AnyHashable : Any]! {
        return [
            "foo": "Foo",
            "bar": "Bar"
        ];
    }
}
