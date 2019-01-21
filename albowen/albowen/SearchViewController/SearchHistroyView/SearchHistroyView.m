//
//  SearchHistroyView.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchHistroyView.h"
#import "SearchHistroyTableViewCell.h"
#import "SearchHotTableViewCell.h"
#import "SearchHeaderView.h"
#import "SearchResultViewController.h"
#import "HomeTableViewCell.h"
#import "DistailViewController.h"

@interface SearchHistroyView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tab;

@end

@implementation SearchHistroyView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.tab];
        [self.tab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        _hotResource = [[NSUserDefaults standardUserDefaults]objectForKey:@"data"];
        _histroyResource = [NSMutableArray new];
        [_histroyResource addObjectsFromArray:_hotResource];
        [_histroyResource addObjectsFromArray:_hotResource];
        
        _histroyResource = [self randomArray:_histroyResource];
    }
    return self;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return _hotResource.count?1:0;
    }
    
    if (section ==1) {
        return _histroyResource.count?_histroyResource.count:0;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SearchHotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchHotTableViewCell"];
        if (!cell) {
            cell = [[SearchHotTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchHotTableViewCell"];
        }
        cell.allResource = _hotResource;
        cell.hotTipDidSeletd = ^(ResourceClass * _Nonnull title) {
            SearchResultViewController *vc = [SearchResultViewController new];
            vc.model = title;
            [self.viewController.navigationController pushViewController:vc animated:YES];
        };
        return cell;
    }
    
    if (indexPath.section ==1) {
        HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"HomeTableViewCell"];
        if (cell == nil) {
            cell = [[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"HomeTableViewCell"];
        }
        
        NSDictionary *dic = _histroyResource[indexPath.row];
        ResourceClass *model = [ResourceClass mj_objectWithKeyValues:dic];
        int x = arc4random() % 5;
        [cell.top sd_setImageWithURL:[NSURL URLWithString:model.imageList[x]] placeholderImage:Def];
        cell.name.text = model.name;
        cell.disLabel.text = model.dis;
        
        return cell;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 20;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section    {
    SearchHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"header"];
    if (header == nil) {
        header = [[SearchHeaderView alloc]initWithReuseIdentifier:@"header"];
    }
    if (section ==0) {
        header.titleLabel.text = @"Hot";
    }
    
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        NSDictionary *dic = _histroyResource[indexPath.row];
        ResourceClass *model = [ResourceClass mj_objectWithKeyValues:dic];
        DistailViewController *vc = [DistailViewController new];
        vc.model = model;
        vc.hidesBottomBarWhenPushed = YES;
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
   
}

-(UITableView *)tab {
    if (!_tab) {
        _tab = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tab.delegate =self;
        _tab.dataSource = self;
        _tab.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tab.sectionHeaderHeight =0;
        _tab.sectionFooterHeight =0;
        _tab.estimatedRowHeight = 200;
        _tab.backgroundColor = KCOLOR(245, 245, 245);
    }
    return _tab;
}

-(NSMutableArray *)randomArray:(NSMutableArray *)ma
{
    //随机数产生结果
    NSMutableArray *resultArray=[[NSMutableArray alloc] initWithCapacity:0];
    //随机数个数
    NSInteger m=ma.count;
    for (int i=0; i<m; i++) {
        int t=arc4random()%ma.count;
        resultArray[i]=ma[t];
        ma[t]=[ma lastObject]; //为更好的乱序，故交换下位置
        [ma removeLastObject];
    }
    return resultArray;
}  

@end
