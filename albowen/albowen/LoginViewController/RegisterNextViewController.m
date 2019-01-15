//
//  RegisterNextViewController.m
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "RegisterNextViewController.h"
#import "LoginInputView.h"

@interface RegisterNextViewController ()
@property (nonatomic, strong)LoginInputView *inputView;
@end

@implementation RegisterNextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIImageView *titleImageView = [UIImageView new];
    titleImageView.image = [UIImage imageNamed:@"Register_title_ico"];
    [self.view addSubview:titleImageView];
    [titleImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.view);
    }];
    
    
    UIImageView *iconImageView = [UIImageView new];
    iconImageView.image = [UIImage imageNamed:@"logo"];
    [self.view addSubview:iconImageView];
    [iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(titleImageView.mas_bottom);
    }];
    
    UIImageView *nameImageV = [UIImageView new];
    nameImageV.image = [UIImage imageNamed:@"login_ico"];
    [self.view addSubview:nameImageV];
    [nameImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(iconImageView.mas_bottom);
    }];
    
    _inputView = [LoginInputView new];
    _inputView.styleType = LoginInputStyleTypeRegisterPass;
    [self.view addSubview:_inputView];
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(nameImageV.mas_bottom).offset(20);
    }];
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn addTarget:self action:@selector(registerBtnEvent) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTitle:@"注册" forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Register_btn_ico"] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = KFONT(15);
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.inputView);
        make.height.equalTo(@80);
        make.top.equalTo(self.inputView.mas_bottom).offset(30);
    }];
}

- (void)registerBtnEvent {
    //密码登录
    if (self.inputView.topTextField.text.length == 0) {
        [CustomView alertMessage:@"请输入密码" view:self.view];
        return;
    }
    if (self.inputView.bottomTextField.text.length == 0) {
        [CustomView alertMessage:@"请再次输入密码" view:self.view];
        return;
    }
    
    if ([self.inputView.bottomTextField.text isEqualToString:self.inputView.topTextField.text]) {
        [CustomView alertMessage:@"两次密码输入不一致,请重新输入" view:self.view];
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
