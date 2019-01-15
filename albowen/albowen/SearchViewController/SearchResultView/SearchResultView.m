//
//  SearchResultView.m
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchResultView.h"
#import "SearchHistroyTableViewCell.h"
#import "SearchResultViewController.h"

@interface SearchResultView()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong)UITableView *tab;
@property (nonatomic, strong)NSArray *allResource;

@end

@implementation SearchResultView

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
        return 1;
    }
    
    if (section ==1) {
        return _allResource.count;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        if (!cell) {
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            cell.backgroundColor = KCOLOR(245, 245, 245);
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.textLabel.text =[NSString stringWithFormat:@"搜索\"%@\"",_title];
        cell.textLabel.font = KFONT(12);
        cell.textLabel.textColor = [UIColor redColor];
        return cell;
    }
    
    if (indexPath.section ==1) {
        SearchHistroyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SearchHistroyTableViewCell"];
        if (!cell) {
            cell = [[SearchHistroyTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SearchHistroyTableViewCell"];
        }
        cell.leftImageView.image = [UIImage imageNamed:@"search"];
        cell.delBtn.hidden = YES;
        cell.line.hidden = YES;
        return cell;
    }
    
    return [UITableViewCell new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return CGFLOAT_MIN;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section == 0) {
        SearchResultViewController *vc = [SearchResultViewController new];
        vc.title = _title;
        [self.viewController.navigationController pushViewController:vc animated:YES];
    } else {
        
    }
}

-(void)setTitle:(NSString *)title {
    _title = title;
    [_tab reloadData];
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
    }
    return _tab;
}

@end
