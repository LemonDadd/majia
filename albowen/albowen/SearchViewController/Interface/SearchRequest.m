//
//  SearchRequest.m
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/14.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchRequest.h"

@implementation SearchRequest

+ (void)requestFindMvSearchLabelRequest:(void(^)(NSArray *message,
                                                 NSString *errorMsg))request {
    
    [HttpHelper httpDataRequestByGetMethod:@"" paramDictionary:nil TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"errorCode"] integerValue];
                if (Code == 0) {
                    NSDictionary *body = dic[@"body"];
                    NSArray *data = body[@"label"];
                    request(data, nil);
                } else {
                    request(nil, dic[@"message"]);
                }
            }
        } else {
            request(nil,data);
        }
    }];
}

+ (void)requestMvUserSearchLogRequest:(void(^)(NSArray *message,
                                               NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [HttpHelper httpDataRequestByGetMethod:@"" paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"errorCode"] integerValue];
                if (Code == 0) {
                    NSDictionary *body = dic[@"body"];
                    NSArray *data = body[@"searchlog"];
                    request(data, nil);
                } else {
                    request(nil, dic[@"message"]);
                }
            }
        } else {
            request(nil,data);
        }
    }];
}

+ (void)requestFindMvTitle:(NSString *)title
                   Request:(void(^)(NSArray *message,
                                    NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:title forKey:@"title"];
    [HttpHelper httpDataRequestByGetMethod:@"" paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                NSInteger Code = [[dic objectForKey:@"errorCode"] integerValue];
                if (Code == 0) {
                    NSDictionary *body = dic[@"body"];
                    NSArray *data = body[@"MV"];
                    request(data, nil);
                } else {
                    request(nil, dic[@"message"]);
                }
            }
        } else {
            request(nil,data);
        }
    }];
}

@end
