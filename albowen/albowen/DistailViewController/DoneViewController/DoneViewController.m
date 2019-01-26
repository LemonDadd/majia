//
//  DoneViewController.m
//  albowen
//
//  Created by quanqiuwa on 2019/1/26.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "DoneViewController.h"

@interface DoneViewController ()

@end

@implementation DoneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = [UIImage imageNamed:@"yudingchenggong"];
    [self.view addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(@100);
    }];
    
    
    UILabel *label = [UILabel new];
    label.text = @"ประสบความสําเร็จ";
    [self.view addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imageView.mas_bottom).offset(10);
        make.centerX.equalTo(imageView);
    }];
    
    UIButton *done =[UIButton buttonWithType:UIButtonTypeCustom];
    done.layer.masksToBounds = YES;
    done.layer.cornerRadius = 5.f;
    done.backgroundColor = kColorWithHex(MCOLOR);
    [done setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [done addTarget:self action:@selector(doneEvent) forControlEvents:UIControlEventTouchUpInside];
    [done setTitle:@"เสร็จสมบูรณ์" forState:UIControlStateNormal];
    done.titleLabel.font = [UIFont fontByName:@"" fontSize:20];
    [self.view addSubview:done];
    [done mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(20);
        make.left.equalTo(self.view).offset(45);
        make.right.equalTo(self.view).offset(-45);
        make.height.mas_equalTo(kHeight(40));
    }];
}

- (void)doneEvent {
    [self.navigationController popToRootViewControllerAnimated:YES];
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
