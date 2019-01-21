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
#import "RegisterViewController.h"
#import "RegisterNextViewController.h"
#import "LoginInterface.h"

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
    
    
    
    _inputView = [LoginInputView new];
    _inputView.styleType = LoginInputStyleTypePassLogin;
    [self.view addSubview:_inputView];
    [_inputView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
    
    _leftLabel = [UILabel new];
    _leftLabel.text = @"การลงทะเบียน";
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
    rightLabel.text = @"ลืมรหัสผ่าน？";
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
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"Register_btn_ico"] forState:UIControlStateNormal];
    [loginBtn setTitle:@"เข้าสู่ระบบ" forState:UIControlStateNormal];
    [loginBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginBtn.titleLabel.font = KFONT(15);
    [self.view addSubview:loginBtn];
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.inputView);
        make.height.equalTo(@80);
        make.top.equalTo(self.leftLabel.mas_bottom);
    }];
    
    UILabel *bottom = [UILabel new];
    bottom.font = [UIFont systemFontOfSize:15];
    bottom.textColor = K_HColor;
    bottom.text = @"ไม่ล็อกอิน";
    [self.view addSubview:bottom];
    [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(loginBtn);
        make.top.equalTo(loginBtn.mas_bottom).offset(10);
    }];

    
    UIButton *btn  = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setBackgroundColor:[UIColor clearColor]];
    [btn addTarget:self action:@selector(close) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(bottom);
    }];
}

- (void)close {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/**
 切换验证码登录与密码登录
 */
- (void)leftEvent:(UIButton *)sender {
    RegisterViewController *vc= [RegisterViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 忘记密码
 */
- (void)rightEvent {
    //todo
    //忘记密码点击
    RegisterNextViewController *vc= [RegisterNextViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

/**
 登录
 */
- (void)login {
    [LoginInterface requestLoginPassByPhone:self.inputView.topTextField.text pass:self.inputView.bottomTextField.text request:^(UserInfoClass * _Nonnull model, NSString * _Nonnull errorMsg) {
        if (model) {
            [model saveUserInfoClass];
            [self dismissViewControllerAnimated:YES completion:nil];
        }else {
            [CustomView alertMessage:errorMsg view:self.view];
        }
    }];
    
    
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
