//
//  SystemSettingController.m
//  Museum
//
//  Created by 关云秀 on 2017/12/8.
//  Copyright © 2017年 xuannalisha. All rights reserved.
//

#import "SystemSettingController.h"
#import "MineViewTabViewCell.h"
#import "BindingPhoneViewController.h"
#import "UpdatePassViewController.h"
#import "TaiLandViewController.h"

@interface SystemSettingController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;
@property (nonatomic, strong)NSArray *imageArray;
@property (nonatomic, strong)NSArray *titleArray;

@end

@implementation SystemSettingController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _mainTableView.delegate =self;
    _mainTableView.dataSource =self;
    _mainTableView.rowHeight = UITableViewAutomaticDimension;
    _mainTableView.estimatedRowHeight = 200;
    [_mainTableView setSeparatorColor:K_H_TextCOLOR];
    _mainTableView.estimatedSectionHeaderHeight = 0;
    _mainTableView.estimatedSectionFooterHeight = 0;
    [self.view addSubview:_mainTableView];
    [self setExtraCellLineHidden:_mainTableView];
    [_mainTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _imageArray = @[@"my_bind_icon",@"my_update_icon"];
    _titleArray =@[@"นโยบายความเป็นส่วนตัว",@"เปลี่ยนรหัสผ่าน"];
}

- (void)setExtraCellLineHidden:(UITableView *)tableView {
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0,-1, kScreenWidth, 200)];;
    view.backgroundColor = [UIColor whiteColor];
    [tableView setTableFooterView:view];
   
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.layer.cornerRadius = 10.f;
    btn.layer.masksToBounds = YES;
    [btn setBackgroundColor:kColorWithHex(MCOLOR)];
    [btn setTitle:@"ออก" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(quitEvent) forControlEvents:UIControlEventTouchUpInside];
    btn.titleLabel.font = [UIFont fontByName:@"" fontSize:20];
    [view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view);
        make.height.mas_equalTo(kHeight(50));
        make.width.mas_equalTo(kScreenWidth-80);
    }];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _imageArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

        MineViewTabViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MineViewTabViewCell"];
        if (cell == nil) {
            cell = [[MineViewTabViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"MineViewTabViewCell"];
            cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        
        cell.leftImageView.image = [UIImage imageNamed:_imageArray[indexPath.row]];
        cell.titleLabel.text = _titleArray[indexPath.row];
        return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 5.f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return .5f;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [UIView new];
    view.backgroundColor = K_H_TextCOLOR;
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIStoryboard *main=[UIStoryboard storyboardWithName:@"Main" bundle:nil];
    if (indexPath.row ==0) {
        TaiLandViewController *vc= [TaiLandViewController new];
        vc.str = @"http://221.204.177.145:8061/feixaun/index.html";
        vc.yc = @"true";
        [self.navigationController pushViewController:vc animated:YES];
        
    } else {
        UpdatePassViewController *vc =[main instantiateViewControllerWithIdentifier:@"UpdatePassViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    }
}

- (void)quitEvent {
    [[UserInfoClass getUserInfoClass]clearUserInfoClass];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
