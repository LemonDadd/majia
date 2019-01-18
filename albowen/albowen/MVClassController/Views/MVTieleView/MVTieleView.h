//
//  MVTieleView.h
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^TieleViewSeletedItem)(NSInteger indx);

@interface MVTieleView : BaseView

@property (nonatomic, copy)TieleViewSeletedItem seletedItem;

@property (nonatomic, assign)NSInteger indx;

@end

NS_ASSUME_NONNULL_END
