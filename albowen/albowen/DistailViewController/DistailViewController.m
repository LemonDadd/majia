//
//  DistailViewController.m
//  albowen
//
//  Created by 关云秀 on 2019/1/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "DistailViewController.h"
#import "ScrTableViewCell.h"
#import "NameTableViewCell.h"
#import "SubscribeViewController.h"
#import "TimeTableViewCell.h"
#import "PhoneTableViewCell.h"
#import "MapTableViewCell.h"

@interface DistailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation DistailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(shouc:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    

    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    _tableView.backgroundColor = K_View_BGColor;
    _tableView.estimatedRowHeight =300;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    view.backgroundColor = [UIColor clearColor];
    UIButton *bottom = [UIButton buttonWithType:UIButtonTypeCustom];
    [bottom setBackgroundColor:[UIColor colorWithNumber:MCOLOR]];
    [bottom setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
    [bottom setTitle:@"立即预约" forState:UIControlStateNormal];
    [bottom addTarget:self action:@selector(btnEVENT) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:bottom];
    bottom.layer.cornerRadius =25;
    bottom.layer.masksToBounds = YES;
    [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view);
        make.height.equalTo(@50);
        make.width.equalTo(view).multipliedBy(.5);
    }];
    
    _tableView.tableFooterView = view;
}


- (void)btnEVENT {
    SubscribeViewController *vc = [SubscribeViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section ==0) {
        ScrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScrTableViewCell"];
        if (cell == nil) {
            cell = [[ScrTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ScrTableViewCell"];
        }
        cell.sdc.imageURLStringsGroup = _model.imageList;
        return cell;
    }
    if (indexPath.section ==1) {
        NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameTableViewCell"];
        if (cell == nil) {
            cell = [[NameTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NameTableViewCell"];
        }
        cell.model = _model;
        return cell;
    }
    
    if (indexPath.section ==2) {
        TimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeTableViewCell"];
        if (cell == nil) {
            cell = [[TimeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TimeTableViewCell"];
        }
        cell.model = _model;
        return cell;
    }
    
    if (indexPath.section ==3) {
        PhoneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PhoneTableViewCell"];
        if (cell == nil) {
            cell = [[PhoneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PhoneTableViewCell"];
        }
        return cell;
    }
    
    if (indexPath.section ==4) {
        MapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MapTableViewCell"];
        if (cell == nil) {
            cell = [[MapTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MapTableViewCell"];
        }
        return cell;
    }
    
    
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}


- (void)shouc:(UIButton *)sender {
    sender.selected = !sender.selected;
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
