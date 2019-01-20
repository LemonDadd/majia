//
//  UserInfoClass.h
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class UserInfoClass;
static UserInfoClass *staticUserInfoClass;

@interface UserInfoClass : NSObject

@property (nonatomic, copy) NSString *id;
@property (nonatomic, copy) NSString *nickname;
@property (nonatomic, copy) NSString *headimg;
@property (nonatomic, copy) NSString *backimg;
@property (nonatomic, copy) NSString *phone;
@property (nonatomic, copy) NSString *isreal;
@property (nonatomic, copy) NSString *weixin;
@property (nonatomic, copy) NSString *qq;
@property (nonatomic, copy) NSString *weibo;
@property (nonatomic, copy) NSString *sex;
@property (nonatomic, copy) NSString *birthday;
@property (nonatomic, copy) NSString *constellation;
@property (nonatomic, copy) NSString *school;
@property (nonatomic, copy) NSString *education;
@property (nonatomic, copy) NSString *occupation;
@property (nonatomic, copy) NSString *sign;
@property (nonatomic, copy) NSString *nativeplace;
@property (nonatomic, copy) NSString *emotionalstate;
@property (nonatomic, copy) NSString *address;
@property (nonatomic, strong)UIImage *image;

/**
 *  获取用户信息
 *
 *  @return
 */
+ (UserInfoClass*)getUserInfoClass;

/**
 *  保存用户信息
 */
- (void)saveUserInfoClass;

/**
 *  清除用户信息
 */
- (void)clearUserInfoClass;

/**
 *  切换用户的头像
 *
 *  @param imagePath
 */
+ (void)saveUserHeadImagePath:(NSString*)imagePath;

+ (void)saveUserHeadImage:(UIImage*)image;
/**
 设置用户属性值
 
 @param value
 @param key
 @return
 */
+ (UserInfoClass *)setValue:(id)value forKey:(NSString *)key;

@end

NS_ASSUME_NONNULL_END
