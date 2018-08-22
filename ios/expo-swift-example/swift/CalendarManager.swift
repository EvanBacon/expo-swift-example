//
//  CalendarManager.swift
//  expo-swift-example
//
//  Created by Evan Bacon on 8/22/18.
//  Copyright © 2018 650 Industries, Inc. All rights reserved.
//

import Foundation
@objc(stest)
class stest: RCTEventEmitter {
    @objc func addEvent(_ name: String, location: String, success: RCTPromiseResolveBlock, reject: RCTPromiseRejectBlock) -> Void {
        print("Hello there")
        success(["back atcha 23"]);
        sendEvent(withName: "Hello",body: [
            "message": "Take me to your leader"
            ]);
    }
    override func supportedEvents() -> [String]! {
        return ["Hello"]
    }
    @objc override func constantsToExport() -> Dictionary<AnyHashable, Any> {
        return [
            "a": "A",
            "b": "B"
        ];
    }
}
