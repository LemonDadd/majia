//
//  HomeView.m
//  albowen
//
//  Created by 关云秀 on 2019/1/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "HomeView.h"
#import "MainTableViewCell.h"
#import "HomeTableViewCell.h"

@interface HomeView()

@property (nonatomic, strong)NSArray *resource;

@end

@implementation HomeView

- (instancetype)init
{
    self = [super init];
    if (self) {
        _allResouce = [NSMutableArray array];
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource =self;
        _tableView.delegate =self;
        _tableView.separatorColor =KCOLOR(251, 251, 251);
        _tableView.estimatedRowHeight =300;
        [self addSubview:_tableView];
        [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
            make.height.equalTo(self);
        }];
        [self addHistoryData];
        
        
    }
    return self;
}

/**
 *  刷新数据
 */
- (void)addHistoryData{
    _tableView.mj_header =[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        // 马上进入刷新状态
        [self updateData:nil];
    }];
    [_tableView.mj_header beginRefreshing];
}

- (void)updateData:(NSArray*)resourceData {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        self.resource = [[NSUserDefaults standardUserDefaults]objectForKey:@"data"];
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    });
}

#pragma mark - tableViewDelegateBegin

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }
    return _resource.count;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section ==0) {
        MainTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MainTableViewCell"];
        if (cell == nil) {
            cell = [[MainTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MainTableViewCell"];
        }
         return cell;
    }
    if (indexPath.section ==1) {
        HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
        if (cell == nil) {
            cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeTableViewCell"];
        }
        NSDictionary *dic = _resource[indexPath.row];
        ResourceClass *model = [ResourceClass mj_objectWithKeyValues:dic];
        [cell.top sd_setImageWithURL:[NSURL URLWithString:model.imageList[0]] placeholderImage:[UIImage imageNamed:@""]];
        cell.name.text = model.name;
        cell.disLabel.text = model.dis;
        
        return cell;
    }
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}

@end
