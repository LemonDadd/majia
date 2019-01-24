//
//  SubscribeView.m
//  Museum
//
//  Created by 关云秀 on 2017/12/3.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SubscribeView.h"
#import "SubscribeViewTopCell.h"
#import "SubscribeViewBottomCell.h"
#import "SubscribeViewCellHeaderView.h"
#import "SubscribeViewCellFooterView.h"
#import "SubscribeViewAlertView.h"
#import "BaseViewController.h"
#import "JhlvShowAlertController.h"

@implementation SubscribeView
{
    NSString *dateStr;
    NSInteger dateIndx;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        _mainTabView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _mainTabView.delegate =self;
        _mainTabView.dataSource =self;
        _mainTabView.scrollEnabled = YES;
        _mainTabView.rowHeight = UITableViewAutomaticDimension;
        _mainTabView.estimatedRowHeight = 200;
        _mainTabView.estimatedSectionHeaderHeight = 0;
        _mainTabView.estimatedSectionFooterHeight = 0;
        _mainTabView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self addSubview:_mainTabView];
        [self setExtraCellLineHidden:_mainTabView];
        [_mainTabView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        _modelClass = [SubscribeViewModelClass new];
        dateIndx = -1;
    }
    return self;
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        SubscribeViewTopCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubscribeViewTopCell"];
        if (cell == nil) {
            cell = [[SubscribeViewTopCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"SubscribeViewTopCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.contentLabel.text =_model.tiaokuan;
        return cell;
    } else {
        SubscribeViewBottomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SubscribeViewBottomCell"];
        if (cell == nil) {
            cell = [[SubscribeViewBottomCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"SubscribeViewBottomCell"];
        }
        cell.titleLabel.text = @"วันที่";
        if (dateStr) {
            cell.contentLabel.text = dateStr;
        }else {
            cell.contentLabel.text = @"วันที่";
        }
        return cell;
    }
   
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    SubscribeViewCellHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SubscribeViewCellHeaderView"];
    if (header == nil) {
        header = [[SubscribeViewCellHeaderView alloc]initWithReuseIdentifier:@"SubscribeViewCellHeaderView"];
    }
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 58.f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50.f;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    SubscribeViewCellFooterView *footer = [tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SubscribeViewCellFooterView"];
    if (footer == nil) {
        footer = [[SubscribeViewCellFooterView alloc]initWithReuseIdentifier:@"SubscribeViewCellFooterView"];
    }
    [footer.yuyueBtn addTarget:self action:@selector(yuyeBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    return footer;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if (indexPath.row == 1) {
        [self showDayAlert:cell];
    }
}


- (void)yuyeBtnEvent {
    if ([UserInfoClass getUserInfoClass] == nil) {
        [(BaseViewController *)self.viewController gotoLoginViewController];
        return;
    }
    
    if (dateStr.length == 0) {
        [CustomView alertMessage:@"วันที่" view:self];
        return;
    }
    SubscribeViewAlertView *alert = [SubscribeViewAlertView new];
    [[CustomView getInstancetype]windowAlertBy:alert isTouchClose:NO color:nil animated:YES addDelegate:nil];
    [alert mas_updateConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(alert.superview);
    }];
    KWeakSelf;
    alert.alertViewCustomBlock = ^(BOOL close, NSString *name, NSString *phone, NSString *idCord) {
        [[CustomView getInstancetype]closeWindowAlertWithanimated:YES];
        if (close == false) {
            weakSelf.modelClass.name = name;
            weakSelf.modelClass.idCord = idCord;
            weakSelf.modelClass.phone = phone;
            [weakSelf requestResvervationAdd];
        }
    };
    [alert layoutIfNeeded];
}


- (void)requestResvervationAdd {
    
    [[CustomView getInstancetype]showWaitView:@"ความสำเร็จใน..." byView:self];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [[CustomView getInstancetype]closeHUD];
        [self.viewController.navigationController popViewControllerAnimated:YES];
    });

}

- (void)showDayAlert:(UITableViewCell *)cell {
    NSMutableArray *dateArray =[NSMutableArray arrayWithArray:[self getOneWeek]];
    [JhlvShowAlertController shareInstance].sender =cell;
    [[JhlvShowAlertController shareInstance]showSheet:@"วันที่" message:nil cancelTitle:nil titleArray:dateArray viewController:[self viewController] confirm:^(NSInteger buttonTag) {
        self->dateStr = dateArray[buttonTag];
        self->dateIndx = buttonTag;
        [self->_mainTabView reloadData];
    }];
}

- (NSArray *)getOneWeek {
    NSMutableArray *arr = [NSMutableArray array];
    for (NSInteger i=0; i<7; i++) {
        NSDate  *date = [NSDate jk_dateAfterDate:[NSDate date] day:i+1];
        NSString * timeStr = [NSString stringWithFormat:@"%@ %@",[NSDate jk_formatYMD:date],[NSDate jk_dayFromWeekday:date]];
        [arr addObject:timeStr];
    }
    return [NSArray arrayWithArray:arr];
}

- (void)leftBtnEvent {
    [self.viewController.navigationController popViewControllerAnimated:YES];
}

-(void)setModel:(ResourceClass *)model {
    _model = model;
    [_mainTabView reloadData];
}

@end
