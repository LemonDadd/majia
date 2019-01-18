//
//  MVClassInterface.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/11.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "MVClassInterface.h"

@implementation MVClassInterface

/**
 精选MVlist
 */
+ (void)requestGetSiftMvByPageON:(NSInteger)page
                         request:(void(^)(MvClassModel *message,
                                          NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:@(page) forKey:@"pageNo"];
    [HttpHelper httpDataRequestByGetMethod:@"http://dansheng.byqckj.com/ds/app/mv/getSiftMv" paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"errorCode"] integerValue];
                if (Code == 0) {
                    NSDictionary *data = dic[@"body"];
                    MvClassModel *model = [MvClassModel mj_objectWithKeyValues:data];
                    request(model, nil);
                } else {
                    request(nil, dic[@"message"]);
                }
            }
        } else {
            request(nil,data);
        }
    }];
}

/**
 推荐MVlist
 */
+ (void)requestGetRecommendMvByPageON:(NSInteger)page
                              request:(void(^)(MvClassModel *message,
                                               NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:@(page) forKey:@"pageNo"];
    [HttpHelper httpDataRequestByGetMethod:@"http://dansheng.byqckj.com/ds/app/mv/getRecommendMv" paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"errorCode"] integerValue];
                if (Code == 0) {
                    NSDictionary *data = dic[@"body"];
                    MvClassModel *model = [MvClassModel mj_objectWithKeyValues:data];
                    request(model, nil);
                } else {
                    request(nil, dic[@"msg"]);
                }
            }
        } else {
            request(nil, data);
        }
    }];
}

@end
