//
//  LoginInterface.m
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/11.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "LoginInterface.h"

@implementation LoginInterface

//密码登录
+ (void)requestLoginPassByPhone:(NSString *)phone
                           pass:(NSString *)pass
                        request:(void(^)(UserInfoClass *model,
                                         NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:phone forKey:@"phone"];
    [paramDic setObject:pass forKey:@"password"];
    [HttpHelper httpDataRequestByGetMethod:LoginBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                 BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    NSDictionary *data = dic[@"body"];
                    UserInfoClass *model = [UserInfoClass mj_objectWithKeyValues:data];
                    request(model, nil);
                } else {
                    request(nil, dic[@"msg"]);
                }
            }
        } else {
            request(nil,data);
        }
    }];
}

//发送登录验证码
+ (void)requestGetLoginCodeByPhone:(NSString *)phone
                           request:(void(^)(BOOL message,
                                            NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:phone forKey:@"phone"];
    [HttpHelper httpDataRequestByGetMethod:GetLoginCodeBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                 BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    request(true, nil);
                } else {
                    request(false, dic[@"msg"]);
                }
            }
        } else {
            request(false,data);
        }
    }];
}


//验证码登录
+ (void)requestLoginCodeByPhone:(NSString *)phone
                           code:(NSString *)code
                        request:(void(^)(UserInfoClass *model,
                                         NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:phone forKey:@"phone"];
    [paramDic setObject:code forKey:@"qrCode"];
    [HttpHelper httpDataRequestByGetMethod:LoginCodeBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(nil, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                 BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    NSDictionary *data = dic[@"body"];
                    UserInfoClass *model = [UserInfoClass mj_objectWithKeyValues:data];
                    request(model, nil);
                } else {
                    request(nil, dic[@"msg"]);
                }
            }
        } else {
            request(nil,data);
        }
    }];
}

//发送注册验证码
+ (void)requestGetRegisterCodeByPhone:(NSString *)phone
                              request:(void(^)(BOOL message,
                                               NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:phone forKey:@"phone"];
    [HttpHelper httpDataRequestByGetMethod:GetRegistCodeBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    request(true, nil);
                } else {
                    request(false, dic[@"msg"]);
                }
            }
        } else {
            request(false,data);
        }
    }];
}

//注册
+ (void)requestRegisterByPhone:(NSString *)phone
                          Pass:(NSString *)pass
                          code:(NSString *)code
                       request:(void(^)(BOOL message,
                                        NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:phone forKey:@"phone"];
    [paramDic setObject:pass forKey:@"password"];
    [paramDic setObject:code forKey:@"qrCode"];
    [HttpHelper httpDataRequestByGetMethod:RegisterBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                 BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    request(true, nil);
                } else {
                    request(false, dic[@"msg"]);
                }
            }
        } else {
            request(false,data);
        }
    }];
}

//三方登录
+ (void)requestLoginByThirdPartyByThirdToken:(NSString *)thirdToken
                                   thirdType:(NSInteger)thirdType
                                     request:(void(^)(UserInfoClass *model,
                                                      NSString *errorMsg))request {
    
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:thirdToken forKey:@"thirdToken"];
    [paramDic setObject:@(thirdType) forKey:@"thirdType"];
    [HttpHelper httpDataRequestByGetMethod:LoginByThirdPartyBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    NSDictionary *data = dic[@"body"];
                    UserInfoClass *model = [UserInfoClass mj_objectWithKeyValues:data];
                    request(model, nil);
                } else {
                    request(false, dic[@"msg"]);
                }
            }
        } else {
            request(false,data);
        }
    }];
}


//三方绑定
+ (void)requestRegisterByThirdPartyByThirdToken:(NSString *)thirdToken
                                      thirdType:(NSInteger)thirdType
                                          phone:(NSString *)phone
                                           code:(NSString *)qrCode
                                        request:(void(^)(UserInfoClass *model,
                                                         NSString *errorMsg))request {
    NSMutableDictionary* paramDic = [[NSMutableDictionary alloc] init];
    [paramDic setObject:thirdToken forKey:@"thirdToken"];
    [paramDic setObject:@(thirdType) forKey:@"thirdType"];
    [paramDic setObject:phone forKey:@"phone"];
    [paramDic setObject:qrCode forKey:@"qrCode"];
    [HttpHelper httpDataRequestByGetMethod:RegisterByThirdPartyBaseUrl paramDictionary:paramDic TimeOutSeconds:120 request:^(BOOL finish, NSString *data) {
        if (finish) {
            if (data == nil) {
                request(false, ErrorMessage);
            } else {
                NSDictionary* dic =[JsonDeal dealJson:data];
                BOOL Code = [[dic objectForKey:@"success"] boolValue];
                if (Code) {
                    NSDictionary *data = dic[@"body"];
                    UserInfoClass *model = [UserInfoClass mj_objectWithKeyValues:data];
                    request(model, nil);
                } else {
                    request(false, dic[@"msg"]);
                }
            }
        } else {
            request(false,data);
        }
    }];
}

@end
