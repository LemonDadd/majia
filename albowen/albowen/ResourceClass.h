//
//  ResourceClass.h
//  albowen
//
//  Created by quanqiuwa on 2019/1/16.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ResourceClass : NSObject

@property (nonatomic, copy)NSString *name;
@property (nonatomic, strong)NSArray *imageList;
@property (nonatomic, copy)NSString * lat;
@property (nonatomic, copy)NSString * lng;
@property (nonatomic, copy)NSString * fenshu;
@property (nonatomic, copy)NSString *ruzhu;
@property (nonatomic, copy)NSString *lidian;
@property (nonatomic, copy)NSString *fangjian;
@property (nonatomic, copy)NSString *dis;
@property (nonatomic, assign)BOOL isSc;

@end

NS_ASSUME_NONNULL_END
