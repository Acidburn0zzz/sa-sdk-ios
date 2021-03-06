//
// SAObject+SAConfigOptions.m
// SensorsAnalyticsSDK
//
// Created by 张敏超🍎 on 2020/6/30.
// Copyright © 2020 Sensors Data Co., Ltd. All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#if ! __has_feature(objc_arc)
#error This file must be compiled with ARC. Either turn on ARC for the project or use -fobjc-arc flag on this file.
#endif

#import "SAObject+SAConfigOptions.h"
#import "SensorsAnalyticsSDK+Private.h"
#import "SALog.h"

@implementation SADatabase (SAConfigOptions)

- (NSUInteger)maxCacheSize {
#ifdef DEBUG
    if (NSClassFromString(@"XCTestCase")) {
        return 10000;
    }
#endif
    return [SensorsAnalyticsSDK sharedInstance].configOptions.maxCacheSize;
}

@end


#pragma mark -

@implementation SAEventFlush (SAConfigOptions)

- (BOOL)isDebugMode {
    return [[SensorsAnalyticsSDK sharedInstance] debugMode] != SensorsAnalyticsDebugOff;
}

- (NSURL *)serverURL {
    return [SensorsAnalyticsSDK sharedInstance].network.serverURL;
}

- (BOOL)flushBeforeEnterBackground {
    return SensorsAnalyticsSDK.sharedInstance.configOptions.flushBeforeEnterBackground;
}

- (BOOL)enableEncrypt {
    return [SensorsAnalyticsSDK sharedInstance].configOptions.enableEncrypt;
}

- (NSString *)cookie {
    return [[SensorsAnalyticsSDK sharedInstance].network cookieWithDecoded:NO];
}

@end


#pragma mark -

@implementation SAEventTracker (SAConfigOptions)

- (BOOL)isDebugMode {
    return [[SensorsAnalyticsSDK sharedInstance] debugMode] != SensorsAnalyticsDebugOff;
}

- (SensorsAnalyticsNetworkType)networkTypePolicy {
    return [[SensorsAnalyticsSDK.sharedInstance valueForKey:@"networkTypePolicy"] integerValue];
}

- (NSInteger)flushBulkSize {
    return SensorsAnalyticsSDK.sharedInstance.configOptions.flushBulkSize;
}

- (BOOL)enableEncrypt {
    return [SensorsAnalyticsSDK sharedInstance].configOptions.enableEncrypt;
}

- (SADataEncryptBuilder *)encryptBuilder {
    return [SensorsAnalyticsSDK sharedInstance].encryptBuilder;
}

@end
