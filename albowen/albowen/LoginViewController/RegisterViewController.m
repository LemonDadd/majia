//
//  RegisterViewController.m
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "RegisterViewController.h"
#import "LoginInputView.h"
#import "RegisterNextViewController.h"
@interface RegisterViewController ()

@property (nonatomic, strong)LoginInputView *inputView;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    UIImageView *titleImageView = [UIImageView new];
    titleImageView.image = [UIImage imageNamed:@"Register_title_ico"];
    [self.view addSubview:titleImageView];
    [titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    
    
   
    _inputView = [LoginInputView new];
    _inputView.styleType = LoginInputStyleTypeRegisterCode;
    [self.view addSubview:_inputView];
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn setTitle:@"ขั้นตอนต่อไป" forState:UIControlStateNormal];
    [loginBtn addTarget:self action:@selector(next) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Register_btn_ico"] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = KFONT(15);
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.inputView);
        make.height.equalTo(@80);
        make.top.equalTo(self.inputView.mas_bottom).offset(30);
    }];
}

- (void)next {
    //密码登录
    if (self.inputView.topTextField.text.length == 0) {
        [CustomView alertMessage:@"ใส่เบอร์มือถือของคุณครับ" view:self.view];
        return;
    }
    if (self.inputView.bottomTextField.text.length == 0) {
        [CustomView alertMessage:@"กรุณาป้อนรหัสยืนยัน" view:self.view];
        return;
    }
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
