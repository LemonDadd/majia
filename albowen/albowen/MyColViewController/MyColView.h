//
//  MyColView.h
//  albowen
//
//  Created by quanqiuwa on 2019/1/19.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "BaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyColView : BaseView<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *allResouce;
@property (nonatomic, strong)NSArray *resource;

@end

NS_ASSUME_NONNULL_END
