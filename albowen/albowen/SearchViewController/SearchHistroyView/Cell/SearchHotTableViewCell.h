//
//  SearchHotTableViewCell.h
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^HotTipDidSeletd)(ResourceClass *title);

@interface SearchHotTableViewCell : UITableViewCell

@property (nonatomic, strong)NSArray *allResource;
@property (nonatomic, copy)HotTipDidSeletd hotTipDidSeletd;

@end

NS_ASSUME_NONNULL_END
