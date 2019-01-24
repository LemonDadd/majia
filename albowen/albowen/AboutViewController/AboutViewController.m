//
//  AboutViewController.m
//  Museum
//
//  Created by 关云秀 on 2018/4/8.
//  Copyright © 2018年 xuannalisha. All rights reserved.
//

#import "AboutViewController.h"

@interface AboutViewController ()

@property (nonatomic, strong)UIImageView *logoImageV;

@end

@implementation AboutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"เกี่ยวกับเรื่องที่เรา";
    
    self.view.backgroundColor = kColorWithHex(0xEEEAE0);
    
    _logoImageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo_ico"]];
    _logoImageV.layer.masksToBounds = YES;
    _logoImageV.layer.cornerRadius = 8.f;
    [self.view addSubview:_logoImageV];
    [_logoImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(self.view).offset(100);
        make.width.height.mas_equalTo(@150);
    }];
    
    UILabel *address = [UILabel new];
    address.text = @"ที่อยู่ : เมืองกว้าง 13 โดยเส้นทางหมายเลข";
    address.font = [UIFont fontByName:nil fontSize:15];
    [self.view addSubview:address];
    [address mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    
    UILabel *phone = [UILabel new];
    phone.text = @"ติดต่อทางโทรศัพท์:0351-4222173";
    phone.font = [UIFont fontByName:nil fontSize:15];
    [self.view addSubview:phone];
    [phone mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(address.mas_bottom).offset(10);
        make.centerX.equalTo(self.view);
    }];
    
    
    UILabel *label = [UILabel new];
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    label.text =[NSString stringWithFormat:@"©️2019 %@  สงวนลิขสิทธิ์",[infoDictionary objectForKey:@"CFBundleDisplayName"]];
    label.font = [UIFont fontByName:nil fontSize:14];
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-40);
        make.centerX.equalTo(self.view);
    }];
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
