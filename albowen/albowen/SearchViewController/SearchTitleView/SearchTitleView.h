//
//  SearchTitleView.h
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@protocol SearchTitleViewDelegate <NSObject>

- (void)searchWithStr:(NSString *)searchStr;

@end

@interface SearchTitleView : BaseView

@property (nonatomic, weak)id<SearchTitleViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
