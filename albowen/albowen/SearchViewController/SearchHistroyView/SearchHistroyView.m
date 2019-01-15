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
    KWeakSelf;
    if (indexPath.section == 0) {
        SearchHotTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchHotTableViewCell"];
        if (!cell) {
            cell = [[SearchHotTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchHotTableViewCell"];
        }
        
        cell.allResource = _hotResource;
        cell.hotTipDidSeletd = ^(NSString * _Nonnull title) {
            [weakSelf pushSearchResultViewController:title];
        };
        return cell;
    }
    
    if (indexPath.section ==1) {
        SearchHistroyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchHistroyTableViewCell"];
        if (!cell) {
            cell = [[SearchHistroyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchHistroyTableViewCell"];
        }
        NSDictionary *dic = _histroyResource[indexPath.row];
        cell.songLabel.text = dic[@"content"];
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
        header.titleLabel.text = @"热门搜索";
    }
    if (section ==1) {
        header.titleLabel.text = @"历史搜索";
    }
    
    return header;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 1) {
        NSDictionary *dic = _histroyResource[indexPath.row];
        [self pushSearchResultViewController:dic[@"content"]];
    }
   
}

- (void)pushSearchResultViewController:(NSString *)title {
    SearchResultViewController *vc = [SearchResultViewController new];
    vc.title = title;
    [self.viewController.navigationController pushViewController:vc animated:YES];
}


-(void)setHotResource:(NSArray *)hotResource {
    _hotResource = hotResource;
    [_tab reloadData];
}

-(void)setHistroyResource:(NSArray *)histroyResource {
    _histroyResource = histroyResource;
    [_tab reloadData];
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

@end
