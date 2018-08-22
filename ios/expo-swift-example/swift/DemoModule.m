//
//  DemoModule.m
//  expo-swift-example
//
//  Created by Evan Bacon on 8/22/18.
//  Copyright © 2018 650 Industries, Inc. All rights reserved.
//

#import <React/RCTBridgeModule.h>
#import <React/RCTEventEmitter.h>
// Export the Native Module name here.
@interface RCT_EXTERN_MODULE(DemoModule, NSObject)
// Make sure the first prop of all the variables (excluding the first) match your swift method.
RCT_EXTERN_METHOD(someMethod:(NSString *)input
                  resolve:(RCTPromiseResolveBlock)resolve
                  reject:(RCTPromiseRejectBlock)reject);
@end
