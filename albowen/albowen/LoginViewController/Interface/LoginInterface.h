//
//  LoginInterface.h
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/11.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "JsonDeal.h"
#import "UserInfoClass.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginInterface : JsonDeal


//密码登录
+ (void)requestLoginPassByPhone:(NSString *)phone
                           pass:(NSString *)pass
                        request:(void(^)(UserInfoClass *model,
                                         NSString *errorMsg))request;

//发送登录验证码
+ (void)requestGetLoginCodeByPhone:(NSString *)phone
                           request:(void(^)(BOOL message,
                                            NSString *errorMsg))request;


//验证码登录
+ (void)requestLoginCodeByPhone:(NSString *)phone
                           code:(NSString *)code
                        request:(void(^)(UserInfoClass *model,
                                         NSString *errorMsg))request;

//发送注册验证码
+ (void)requestGetRegisterCodeByPhone:(NSString *)phone
                              request:(void(^)(BOOL message,
                                               NSString *errorMsg))request;

//注册
+ (void)requestRegisterByPhone:(NSString *)phone
                          Pass:(NSString *)pass
                          code:(NSString *)code
                       request:(void(^)(BOOL message,
                                        NSString *errorMsg))request;


//三方登录
+ (void)requestLoginByThirdPartyByThirdToken:(NSString *)thirdToken
                                   thirdType:(NSInteger)thirdType
                                     request:(void(^)(UserInfoClass *model,
                                                      NSString *errorMsg))request;

//三方绑定
+ (void)requestRegisterByThirdPartyByThirdToken:(NSString *)thirdToken
                                      thirdType:(NSInteger)thirdType
                                          phone:(NSString *)phone
                                           code:(NSString *)qrCode
                                        request:(void(^)(UserInfoClass *model,
                                                         NSString *errorMsg))request;

@end

NS_ASSUME_NONNULL_END
