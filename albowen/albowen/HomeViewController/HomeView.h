//
//  HomeView.h
//  albowen
//
//  Created by 关云秀 on 2019/1/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN
@protocol MainTableViewDegate <NSObject>

@end

@interface HomeView : BaseView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *allResouce;

@end

NS_ASSUME_NONNULL_END
