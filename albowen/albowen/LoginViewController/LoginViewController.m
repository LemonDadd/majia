//
//  LoginViewController.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginInputView.h"
#import "AppDelegate.h"

@interface LoginViewController ()

@property (nonatomic, strong)LoginInputView *inputView;
@property (nonatomic, strong)UIView *tripartiteLoginView;
@property (nonatomic, strong)UILabel *leftLabel;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.hidden = YES;
    
    
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
        make.bottom.equalTo(titleImageView.mas_bottom).offset(10);
    }];
    
    UIImageView *nameImageV = [UIImageView new];
    nameImageV.image = [UIImage imageNamed:@"login_ico"];
    [self.view addSubview:nameImageV];
    [nameImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(iconImageView.mas_bottom);
    }];
    
    
    
    _inputView = [LoginInputView new];
    _inputView.styleType = LoginInputStyleTypePassLogin;
    [self.view addSubview:_inputView];
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.top.equalTo(nameImageV.mas_bottom).offset(20);
    }];
    
    _leftLabel = [UILabel new];
    _leftLabel.text = @"密码登录";
    _leftLabel.font = [UIFont systemFontOfSize:12];
    _leftLabel.textColor = K_HColor;
    [self.view addSubview:_leftLabel];
    [_leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.inputView).offset(8);
        make.top.equalTo(self.inputView.mas_bottom);
    }];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn addTarget:self action:@selector(leftEvent:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:leftBtn];
    [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.leftLabel);
    }];
    
    
    
    UILabel *rightLabel = [UILabel new];
    rightLabel.font = [UIFont systemFontOfSize:12];
    rightLabel.textColor = K_HColor;
    rightLabel.text = @"忘记密码?";
    [self.view addSubview:rightLabel];
    [rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.inputView).offset(-8);
        make.top.equalTo(self.inputView.mas_bottom);
    }];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [rightBtn addTarget:self action:@selector(rightEvent) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:rightBtn];
    [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(rightLabel);
    }];
    
    
    
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [loginBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_ico"] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = KFONT(15);
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.inputView);
        make.height.equalTo(@80);
        make.top.equalTo(self.leftLabel.mas_bottom);
    }];
    
    
    _tripartiteLoginView = [UIView new];
    [self.view addSubview:_tripartiteLoginView];
    [_tripartiteLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-20);
        make.height.equalTo(@40);
        make.left.right.equalTo(loginBtn);
    }];

}


/**
 切换验证码登录与密码登录
 */
- (void)leftEvent:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _leftLabel.text = @"验证码登录";
        _inputView.styleType = LoginInputStyleTypeCodeLogin;
    } else {
         _leftLabel.text = @"密码登录";
         _inputView.styleType = LoginInputStyleTypePassLogin;
    }
}

/**
 忘记密码
 */
- (void)rightEvent {
    //todo
    //忘记密码点击
}

/**
 登录
 */
- (void)login {
    
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
