//
//  MVClassView.h
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MVClassViewType) {
    MVClassViewTypeSwift = 0,
    MVClassViewTypeRecommend,
};

@interface MVClassView : BaseView

@property (nonatomic, assign)MVClassViewType type;

@end

NS_ASSUME_NONNULL_END
