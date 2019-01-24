//
//  AppDelegate+Push.m
//  albowen
//
//  Created by 关云秀 on 2019/1/23.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "AppDelegate+Push.h"



@implementation AppDelegate (Push)

- (void)initPush:(NSDictionary *)launchOptions {
   
    JPUSHRegisterEntity * entity = [[JPUSHRegisterEntity alloc] init];
    if (@available(iOS 12.0, *)) {
        entity.types = JPAuthorizationOptionAlert|JPAuthorizationOptionBadge|JPAuthorizationOptionSound|JPAuthorizationOptionProvidesAppNotificationSettings;
    } else {
        // Fallback on earlier versions
    }
    [AVOSCloud setApplicationId:@"8KE8Ws36OBhsI3sEPaEBXz8G-gzGzoHsz" clientKey:@"3b3DUwfUkKkf0fjsz6hiFVCq"];
    [JPUSHService registerForRemoteNotificationConfig:entity delegate:self];
    [JPUSHService setupWithOption:launchOptions appKey:@"df798e40b062fab7d6ff2baa" channel:@"" apsForProduction:true];
}


@end
