//
//  AppDelegate.m
//  albowen
//
//  Created by 关云秀 on 2019/1/12.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "AppDelegate.h"
#import "BaseTabBarController.h"
#import "ResourceClass.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    _window.rootViewController = [BaseTabBarController new];
    [_window makeKeyAndVisible];
    
    NSArray* list = [[NSUserDefaults standardUserDefaults]objectForKey:@"data"];
    if (list == nil) {
        [self initData];
    }
    return YES;
}



- (void)initData {
    NSString *date = @"{\"item\": [{         \"name\": \"传统泰式酒店\",         \"isSc\": false,         \"fenshu\": 7.6,         \"lat\": 13.75919,         \"lng\": 100.49651,         \"dis\": \"酒店就在考山路的中间段，吃喝非常方便，酒店的早餐也非常丰富。酒店楼顶的泳池充满了小情调。\",         \"imageList\": [\"http://p2-q.mafengwo.net/s10/M00/9F/EA/wKgBZ1mIb0OAA50wAAIdaeBF-i416.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\", \"http://p4-q.mafengwo.net/s6/M00/B2/BE/wKgB4lMDacGAPLq7AAKizs4AHDw28.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b1-q.mafengwo.net/s6/M00/22/9D/wKgB4lMOfwCAUhaEAAGquSxMU8Y47.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://n2-q.mafengwo.net/s10/M00/9F/E8/wKgBZ1mIb0KAEhHYAAHrcl5-u5E76.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b3-q.mafengwo.net/s11/M00/7D/30/wKgBEFsiGMSATat7AAVJB2dLxEw20.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b1-q.mafengwo.net/s7/M00/1B/16/wKgB6lS9w_WABdwvAAZR9r9y__I00.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b3-q.mafengwo.net/s10/M00/9F/F2/wKgBZ1mIb0OAPdSQAAJAKHTZdsI59.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]     }, {         \"name\": \"D&D旅馆\",         \"isSc\": false,         \"fenshu\": 7.1,         \"lat\": 13.75918,         \"lng\": 100.49651,         \"dis\": \"酒店在曼谷考山路上，非常热闹，早上有许多特色小吃、夜里有许多酒吧，非常适合年轻人。酒店周边也有许多马杀鸡。\",         \"imageList\": [\"http://n4-q.mafengwo.net/s9/M00/BF/A6/wKgBs1ZqgzqASo7kAAL1Wvut1R040.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\", \"http://n4-q.mafengwo.net/s11/M00/B3/E8/wKgBEFsyGcKAcRVAAAJ2u0bVLRg85.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b2-q.mafengwo.net/s9/M00/BF/A7/wKgBs1ZqgzqAS_U6AAIrytVvyAQ57.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p4-q.mafengwo.net/s6/M00/22/7C/wKgB4lMOfuyAUKXSAAE77__rvnM87.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://n3-q.mafengwo.net/s11/M00/B3/E8/wKgBEFsyGcKAd34KAAlxQbGpUeY39.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://n1-q.mafengwo.net/s10/M00/4D/3A/wKgBZ1oS5RWAQnl5AAKnjVN0Eoo36.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p1-q.mafengwo.net/s9/M00/BF/F7/wKgBs1Zqg6qAbxzWAAIRkAYwVKQ32.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]     }, {         \"name\": \"曼谷德维基西普精品酒店\",         \"isSc\": false,         \"fenshu\": 8.6,         \"lat\": 13.77006,         \"lng\": 100.50535,         \"dis\": \"老板会说中文，房间陈设简约大气，古朴有沉淀感，早餐细腻讲究，菜式多样，口味很棒，无论环境还是服务都很受欢迎。\",         \"imageList\": [\"http://b4-q.mafengwo.net/s5/M00/DE/F2/wKgB3FIGX8iAMQLHAAd3JV1nTa827.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\", \"http://n3-q.mafengwo.net/s6/M00/D6/CE/wKgB4lI-qkuAeP2DAAte6bLiEMw22.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p3-q.mafengwo.net/s10/M00/09/19/wKgBZ1mMuQmAc9EJAAEwomHOIMY92.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://n2-q.mafengwo.net/s5/M00/DE/F6/wKgB3FIGX8yAb-q6AAP9Hi1PyhQ71.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b4-q.mafengwo.net/s8/M00/2B/55/wKgBpVWRMhCAJO0WAAaaTLzXG4s14.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b4-q.mafengwo.net/s11/M00/F8/66/wKgBEFpwTIyAcADtAAYO_2vmiEk37.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b1-q.mafengwo.net/s6/M00/D6/CD/wKgB4lI-qkmATVD8AA1mC4hFkFI26.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]     }, {         \"name\": \"奇莱克斯度假酒店预订\",         \"isSc\": false,         \"fenshu\": 8.4,         \"lat\": 13.76271,         \"lng\": 100.49988,         \"dis\": \"位置不错，距离热闹的考山路仅走路5分钟，去往大皇宫等景点也是非常方便。酒店内部较新，装修精致，设施齐全。\",         \"imageList\": [\"http://b4-q.mafengwo.net/s6/M00/75/E4/wKgB4lMCAEmAG--hAANXc-WfkXk10.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\", \"http://p1-q.mafengwo.net/s7/M00/3F/41/wKgB6lPU1SKABDUsAA03m-HqVgo01.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p3-q.mafengwo.net/s11/M00/08/3E/wKgBEFr6nK-ABYctAAfD-nw70EY75.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b3-q.mafengwo.net/s11/M00/08/38/wKgBEFr6nK6AEn6rAACdTSNGv1c38.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b1-q.mafengwo.net/s11/M00/08/39/wKgBEFr6nK6AMNo5AADqO7D728A95.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://n1-q.mafengwo.net/s11/M00/08/59/wKgBEFr6nLqASI08AAf2GdZrwsE45.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b3-q.mafengwo.net/s11/M00/08/5E/wKgBEFr6nL2AHv3zAAF56rUFqzE78.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]     }, {         \"name\": \"皇家公主兰朗酒店\",         \"isSc\": false,         \"fenshu\": 8.3,         \"lat\": 13.7577,         \"lng\": 100.51307,         \"dis\": \"酒店的地理位置还不错，距离大皇宫和考山路仅有三公里，打车几分钟就可到达。酒店有免费班车前往购物场所，非常人性化。。\",         \"imageList\": [\"http://p4-q.mafengwo.net/s10/M00/93/E0/wKgBZ1l9ce6AeKspAAIdwYddcs429.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\", \"http://n4-q.mafengwo.net/s10/M00/93/DC/wKgBZ1l9ceeAQnX9AAIUywloMF438.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p2-q.mafengwo.net/s6/M00/F8/CB/wKgB4lMOYfKAbCyVAAJjWKmTMCg92.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p2-q.mafengwo.net/s6/M00/F8/BB/wKgB4lMOYemAG_e4AAHSurBNoqo33.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b2-q.mafengwo.net/s10/M00/98/6C/wKgBZ1mIbkuAZKxRAAJ4LglGExo70.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p4-q.mafengwo.net/s10/M00/98/69/wKgBZ1mIbkuAfiQaAAJxxqZe3os05.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p3-q.mafengwo.net/s7/M00/BA/E3/wKgB6lR0UJGAQyToAAJpn-xF-MQ69.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]     }, {         \"name\": \"莫克酒店\",         \"isSc\": false,         \"fenshu\": 8,         \"lat\": 13.76173,         \"lng\": 100.50423,         \"dis\": \"一家复古格调的酒店，就在考山路附近，提供前往考山商圈的免费tutu车，出行便利。客房虽不崭新，但干净舒适，很有格...\",         \"imageList\": [\"http://n1-q.mafengwo.net/s10/M00/49/80/wKgBZ1odFCSAb00eAAOYYIBVyrA16.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\", \"http://n1-q.mafengwo.net/s8/M00/F8/19/wKgBpVX7dreAX-tKAAKEzhuFPes93.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p4-q.mafengwo.net/s8/M00/F8/0A/wKgBpVX7dqOAMTqtAALqJrElgzA62.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://n4-q.mafengwo.net/s8/M00/F7/D7/wKgBpVX7doSAbKfbAAFrfPCNPNU05.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://n4-q.mafengwo.net/s7/M00/A6/E5/wKgB6lRy9oOAXI-pAAHQ-2H_esI10.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b1-q.mafengwo.net/s8/M00/F8/0D/wKgBpVX7dqeAUOcNAAKtVKJxlAk00.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p1-q.mafengwo.net/s2/M00/8D/E5/wKgBpU449SXCUDM7AABVKLuttrM65.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]     }, {         \"name\": \"考山皇宫酒店（原考山皇宫旅馆）\",         \"isSc\": false,         \"fenshu\": 6.3,         \"lat\": 13.75905,         \"lng\": 100.49721,         \"dis\": \"酒店距离考山路和大皇宫比较近，周围有7-11和许多餐厅酒吧，酒店还提供免费WiFi和屋顶泳池，房间干净整洁，员工也都...\",         \"imageList\": [\"http://n4-q.mafengwo.net/s6/M00/5F/91/wKgB4lMDIIiAQzzgAAJJDud2z3c86.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\", \"http://b4-q.mafengwo.net/s7/M00/C3/2D/wKgB6lQqU7yAc73ZAAeWf7q-NWE48.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b3-q.mafengwo.net/s6/M00/7F/BE/wKgB4lNbkaSAdkbhAB6QoHrbIho26.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p4-q.mafengwo.net/s6/M00/BB/0F/wKgB4lMNxsyATwzyAAE7GpzMNAg35.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p4-q.mafengwo.net/s7/M00/2C/27/wKgB6lR0o7eAJFF0AABm0X_mMMg35.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b2-q.mafengwo.net/s10/M00/54/0E/wKgBZ1ogLYWAK8iXAAUm7qO7aHo06.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b4-q.mafengwo.net/s5/M00/CD/39/wKgB21Bi1h67Tc5NAAVmXrr2FxM71.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]     }, {         \"name\": \"维新安睡酒店预订\",         \"isSc\": false,         \"fenshu\": 6.2,         \"lat\": 13.7602,         \"lng\": 100.49687,         \"dis\": \"酒店就在考山路的中间段，吃喝非常方便，酒店的早餐也非常丰富。酒店楼顶的泳池充满了小情调。\",         \"imageList\": [\"http://n3-q.mafengwo.net/s6/M00/A8/3D/wKgB4lMDYJqAJnRPAAHzii7sk1s03.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90\", \"http://p1-q.mafengwo.net/s8/M00/9B/43/wKgBpVYXZ-eAQIOwAAJKKES9hCM14.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b3-q.mafengwo.net/s8/M00/9B/18/wKgBpVYXZ7qABt0LAAFJBWVNkf862.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://n3-q.mafengwo.net/s8/M00/9B/26/wKgBpVYXZ8mAAN41AAHgXrlz3yA67.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://n1-q.mafengwo.net/s5/M00/EC/19/wKgB21BDH_mZPMbCAAEcpayrR_M06.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://p1-q.mafengwo.net/s6/M00/A8/3D/wKgB4lMDYJmAVugbAALK0mLocLI22.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\", \"http://b4-q.mafengwo.net/s8/M00/9B/1E/wKgBpVYXZ8CAFw7fAAEaICcb8CU99.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90\"]     }] }";
    
    NSDictionary *retDict = [self dictionaryWithJsonString:date];
    
    NSArray *list = retDict[@"item"];
    NSMutableArray *ma = [NSMutableArray new];
    for (NSDictionary *dic in list) {
         int y =100 +  (arc4random() % 101);
        ResourceClass *model = [ResourceClass mj_objectWithKeyValues:dic];
        model.ruzhu =[NSString stringWithFormat:@"PM:2:00"];
        model.lidian = @"AM:12:00";
        model.fangjian =[NSString stringWithFormat:@"%d",y];
        model.isSc = false;
        NSDictionary *dic = [model mj_JSONObject];
        [ma addObject:dic];
    }
    [[NSUserDefaults standardUserDefaults]setObject:[NSArray arrayWithArray:ma] forKey:@"data"];
}



- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData
                                                        options:NSJSONReadingMutableContainers
                                                          error:&err];
    if(err)
    {
        NSLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
