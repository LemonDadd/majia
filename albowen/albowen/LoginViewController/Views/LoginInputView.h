//
//  LoginInputView.h
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, LoginInputStyleType) {
    LoginInputStyleTypePassLogin = 0,//密码登录
    LoginInputStyleTypeCodeLogin,//验证码登录
    LoginInputStyleTypeRegisterPass,//注册密码
    LoginInputStyleTypeRegisterCode//注册验证码
};
@interface LoginInputView : BaseView

@property (nonatomic, assign)LoginInputStyleType styleType;

@property (nonatomic, strong)UITextField *topTextField;//上部field
@property (nonatomic, strong)UITextField *bottomTextField;//下部field

@end

NS_ASSUME_NONNULL_END
