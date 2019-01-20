//
//  MyColViewController.m
//  albowen
//
//  Created by quanqiuwa on 2019/1/19.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "MyColViewController.h"
#import "HomeTableViewCell.h"
#import "DistailViewController.h"

@interface MyColViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *allResouce;
@property (nonatomic, strong)NSArray *resource;

@end

@implementation MyColViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _allResouce = [NSMutableArray array];
    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    _tableView.separatorColor =KCOLOR(251, 251, 251);
    _tableView.estimatedRowHeight =300;
    _tableView.ly_emptyView = [LYEmptyView emptyViewWithImageStr:@"wushuju"
                                                            titleStr:@"ไม่มีข้อมูล"
                                                           detailStr:@""];
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    [self addHistoryData];
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
    KWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        if (weakSelf.isCol) {
            self.resource = [[NSUserDefaults standardUserDefaults]objectForKey:@"col"];
        } else {
            self.resource = nil;
        }
        [self.tableView.mj_header endRefreshing];
        [self.tableView reloadData];
    });
}

#pragma mark - tableViewDelegateBegin

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _resource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}



- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
    if (cell == nil) {
        cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeTableViewCell"];
    }
    NSDictionary *dic = _resource[indexPath.row];
    ResourceClass *model = [ResourceClass mj_objectWithKeyValues:dic];
    [cell.top sd_setImageWithURL:[NSURL URLWithString:model.imageList[0]] placeholderImage:Def];
    cell.name.text = model.name;
    cell.disLabel.text = model.dis;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSDictionary *dic = _resource[indexPath.row];
    ResourceClass *model = [ResourceClass mj_objectWithKeyValues:dic];
    DistailViewController *vc = [DistailViewController new];
    vc.model = model;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
