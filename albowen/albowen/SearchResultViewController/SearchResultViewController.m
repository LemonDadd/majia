//
//  SearchResultViewController.m
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchResultViewController.h"
#import "SearchResultTableViewCell.h"
#import "SearchRequest.h"
#import "DistailViewController.h"

@interface SearchResultViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tab;
@property (nonatomic, strong)NSArray *allResource;

@end

@implementation SearchResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"ค้นหา";
    
    [self.view addSubview:self.tab];
    [self.tab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    if (self.model) {
        self.allResource = [NSArray arrayWithObject:self.model];
    }
    
//    KWeakSelf;
//    [SearchRequest requestFindMvTitle:@"" Request:^(NSArray * _Nonnull message, NSString * _Nonnull errorMsg) {
//        weakSelf.allResource = message;
//        [weakSelf.tab  reloadData];
//    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _allResource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SearchResultTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[SearchResultTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchResultTableViewCell"];
    }
    ResourceClass *model = _allResource[indexPath.row];
    [cell.leftImageView sd_setImageWithURL:[NSURL URLWithString:model.imageList[0]] placeholderImage:Def];
    cell.nameLabel.text = model.name;
    cell.detailLabel.text = model.;
    cell.countLabel.text = model.fangjian;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DistailViewController *vc = [DistailViewController new];
    vc.model = self.model;
    vc.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(UITableView *)tab {
    if (!_tab) {
        _tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tab.delegate =self;
        _tab.dataSource = self;
        _tab.sectionHeaderHeight =0;
        _tab.sectionFooterHeight =0;
        _tab.estimatedRowHeight = 200;
        _tab.backgroundColor = KCOLOR(245, 245, 245);
        _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tab;
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
