//
//  AppDelegate+Push.h
//  albowen
//
//  Created by 关云秀 on 2019/1/23.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "AppDelegate.h"
#import "JPUSHService.h"
// iOS10 注册 APNs 所需头文件
#ifdef NSFoundationVersionNumber_iOS_9_x_Max
#import <UserNotifications/UserNotifications.h>
#import <AudioToolbox/AudioToolbox.h>
#endif

NS_ASSUME_NONNULL_BEGIN

@interface AppDelegate (Push)

- (void)initPush:(NSDictionary *)launchOptions;
@end

NS_ASSUME_NONNULL_END
