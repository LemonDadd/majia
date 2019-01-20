//
//  LoginInputView.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "LoginInputView.h"
#import "RegisterViewController.h"

@interface LoginInputView()

@property (nonatomic, strong)UIImageView *bgImageView;
//顶部
@property (nonatomic, strong)UIView *topView;
@property (nonatomic, strong)UIImageView *leftImageV;
@property (nonatomic, strong)UILabel *topLabel;


//底部
@property (nonatomic, strong)UIView *bottomView;
@property (nonatomic, strong)UIImageView *bottomLeftImageV;
@property (nonatomic, strong)UILabel *bottomLabel;

@property (nonatomic, strong)UIButton *passButton;
@property (nonatomic, strong)UIButton *codeButton;


@end

@implementation LoginInputView


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _bgImageView = [UIImageView new];
        _bgImageView.userInteractionEnabled = YES;
        [self addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.right.bottom.equalTo(self);
        }];

        _topView = [UIView new];
        [_bgImageView addSubview:_topView];
        [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
            make.right.equalTo(@-10);
            make.bottom.equalTo(self.bgImageView.mas_centerY).offset(-10);
        }];
        [self  initTopUi];
        
        _bottomView = [UIView new];
        [_bgImageView addSubview:_bottomView];
        [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bgImageView.mas_centerY);
            make.left.right.height.equalTo(self.topView);
        }];
        [self initBottomUi];
        
    }
    return self;
}


- (void)initTopUi {
    _leftImageV = [UIImageView new];
    _leftImageV.contentMode = UIViewContentModeScaleAspectFit;
    [_topView addSubview:_leftImageV];
    [_leftImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.topView);
        make.left.equalTo(self.topView).offset(10);
        make.width.height.equalTo(@25);
    }];
    
    _topLabel = [UILabel new];
    _topLabel.textColor = K_HColor;
    _topLabel.font = KFONT(12);
    [_topView addSubview:_topLabel];
    [_topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leftImageV.mas_right).offset(8);
        make.top.equalTo(self.leftImageV);
    }];
    
    _topTextField = [UITextField new];
    _topTextField.font =KFONT(13);
    [_topView addSubview:_topTextField];
    [_topTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.topLabel);
        make.top.equalTo(self.topLabel.mas_bottom).offset(5);
        make.height.equalTo(@20);
        make.right.equalTo(self.topView).offset(-100);
    }];
    
   
}

- (void)initBottomUi {
    _bottomLeftImageV = [UIImageView new];
    _bottomLeftImageV.contentMode = UIViewContentModeScaleAspectFit;
    [_bottomView addSubview:_bottomLeftImageV];
    [_bottomLeftImageV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView);
        make.left.equalTo(self.bottomView).offset(10);
        make.width.height.equalTo(@25);
    }];
    
    _bottomLabel = [UILabel new];
    _bottomLabel.textColor = K_HColor;
    _bottomLabel.font = KFONT(12);
    [_bottomView addSubview:_bottomLabel];
    [_bottomLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomLeftImageV.mas_right).offset(8);
        make.top.equalTo(self.bottomLeftImageV);
    }];
    
    _bottomTextField = [UITextField new];
     _bottomTextField.font = KFONT(13);
    [_bottomView addSubview:_bottomTextField];
   
    
    _passButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_passButton addTarget:self action:@selector(passSecureEvent:) forControlEvents:UIControlEventTouchUpInside];
    _passButton.imageView.contentMode =UIViewContentModeScaleAspectFit;
    [_bottomView addSubview:_passButton];
    [_passButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView);
        make.right.equalTo(self.bottomView).offset(-10);
        make.width.height.equalTo(@20);
    }];
    
    _codeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [_codeButton addTarget:self action:@selector(sendCode:) forControlEvents:UIControlEventTouchUpInside];
    [_codeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _codeButton.titleLabel.font = KFONT(13);
    [_bottomView addSubview:_codeButton];
    [_codeButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.bottomView);
        make.right.equalTo(self.bottomView).offset(-10);
        make.height.equalTo(@30);
        make.width.equalTo(@80);
    }];
    
    [_bottomTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomLabel);
        make.top.equalTo(self.bottomLabel.mas_bottom).offset(5);
        make.height.equalTo(@20);
        make.right.equalTo(self.codeButton.mas_left).offset(-10);
    }];
    
}

- (void)setStyleType:(LoginInputStyleType)styleType {
    
    _styleType = styleType;

    if (_styleType == LoginInputStyleTypePassLogin) {
        _bgImageView.image = [UIImage imageNamed:@"login_input_ico"];
        _leftImageV.image = [UIImage imageNamed:@"login_phone_ico"];
        _topLabel.text =@"เบอร์มือถือ";
        _topTextField.text = nil;
        _topTextField.keyboardType = UIKeyboardTypeNumberPad;
        _topTextField.placeholder = @"เบอร์มือถือ";
        _bottomLeftImageV.image = [UIImage imageNamed:@"login_pass_ico"];
        _bottomLabel.text = @"รหัสผ่าน";
        _bottomTextField.text = nil;
        _bottomTextField.keyboardType = UIKeyboardTypeDefault;
        _bottomTextField.placeholder = @"รหัสผ่าน";
        _bottomTextField.secureTextEntry = YES;
        _codeButton.hidden = YES;
        _passButton.hidden = NO;
        [_passButton setImage:[UIImage imageNamed:@"login_eye_no_ico"] forState:UIControlStateNormal];
        
    }
    if (styleType == LoginInputStyleTypeCodeLogin) {
        _bgImageView.image = [UIImage imageNamed:@"login_input_ico"];
        _leftImageV.image = [UIImage imageNamed:@"login_phone_ico"];
        _topLabel.text =@"เบอร์มือถือ";
        _topTextField.text = nil;
        _topTextField.placeholder = @"เบอร์มือถือ";
        _topTextField.keyboardType = UIKeyboardTypeNumberPad;
        _bottomLeftImageV.image = [UIImage imageNamed:@"login_code_ico"];
        _bottomLabel.text = @"验证码";
        _bottomTextField.text = nil;
        _bottomTextField.placeholder = @"请输入验证码";
        _bottomTextField.keyboardType = UIKeyboardTypeNumberPad;
        _bottomTextField.secureTextEntry = false;
        _codeButton.hidden = NO;
        _passButton.hidden = YES;
        [_codeButton setBackgroundImage:[UIImage imageNamed:@"login_codebtn_ico"] forState:UIControlStateNormal];
        [_codeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    }
    if (styleType == LoginInputStyleTypeRegisterPass) {
        _bgImageView.image = [UIImage imageNamed:@"Register_input_ico"];
        _leftImageV.image = [UIImage imageNamed:@"Register_pass_ico"];
        _topLabel.text =@"รหัสผ่าน";
        _topTextField.text = nil;
        _topTextField.placeholder = @"รหัสผ่าน";
        _bottomLeftImageV.image = [UIImage imageNamed:@"Register_pass_ico"];
        _bottomLabel.text = @"รหัสผ่าน";
        _bottomTextField.text = nil;
        _bottomTextField.placeholder = @"รหัสผ่าน";
        _bottomTextField.secureTextEntry = YES;
        _codeButton.hidden = YES;
        _passButton.hidden = NO;
        [_passButton setImage:[UIImage imageNamed:@"login_eye_no_ico"] forState:UIControlStateNormal];
        
    }
    if (styleType == LoginInputStyleTypeRegisterCode) {
        _bgImageView.image = [UIImage imageNamed:@"Register_input_ico"];
        _leftImageV.image = [UIImage imageNamed:@"Register_phone_ico"];
        _topLabel.text =@"เบอร์มือถือ";
        _topTextField.text = nil;
        _topTextField.keyboardType = UIKeyboardTypeNumberPad;
        _topTextField.placeholder = @"เบอร์มือถือ";
        _bottomLeftImageV.image = [UIImage imageNamed:@"Register_code_ico"];
        _bottomLabel.text = @"รหัสยืนยัน";
        _bottomTextField.text = nil;
        _bottomTextField.placeholder = @"รหัสยืนยัน";
        _bottomTextField.keyboardType = UIKeyboardTypeNumberPad;
        _bottomTextField.secureTextEntry = false;
        _codeButton.hidden = NO;
        _passButton.hidden = YES;
        [_codeButton setBackgroundImage:[UIImage imageNamed:@"Register_codebtn_ico"] forState:UIControlStateNormal];
        [_codeButton setTitle:@"รหัสยืนยัน" forState:UIControlStateNormal];
    }
    
}

//显示密码
- (void)passSecureEvent:(UIButton *)sender {
    _bottomTextField.secureTextEntry = !_bottomTextField.isSecureTextEntry;
    if (_styleType == LoginInputStyleTypeRegisterPass) {
        _topTextField.secureTextEntry = !_topTextField.isSecureTextEntry;
    }
    if (_bottomTextField.isSecureTextEntry) {
         [_passButton setImage:[UIImage imageNamed:@"login_eye_no_ico"] forState:UIControlStateNormal];
    } else {
        if (_styleType == LoginInputStyleTypePassLogin) {
             [_passButton setImage:[UIImage imageNamed:@"login_eye_ico"] forState:UIControlStateNormal];
        } else {
            [_passButton setImage:[UIImage imageNamed:@"Register_eye_ico"] forState:UIControlStateNormal];
        }
        
    }
}

//发送验证码
- (void)sendCode:(UIButton *)sender {
    KWeakSelf;
    __block int timeout= 60; //倒计时时间
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0,queue);
    dispatch_source_set_timer(_timer,dispatch_walltime(NULL, 0),1.0*NSEC_PER_SEC, 0); //每秒执行
    dispatch_source_set_event_handler(_timer, ^{
        if(timeout<=0){ //倒计时结束，关闭
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                [weakSelf.codeButton setBackgroundImage:[UIImage imageNamed:@"login_codebtn_ico"] forState:UIControlStateNormal];
                [weakSelf.codeButton setTitle:@"รหัสยืนยัน" forState:UIControlStateNormal];
                 [weakSelf.codeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                sender.userInteractionEnabled = YES;
            });
        }else{
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [UIView beginAnimations:nil context:nil];
                [UIView setAnimationDuration:1];
                [weakSelf.codeButton setBackgroundImage:[UIImage imageNamed:@"login_code_no_ico"] forState:UIControlStateNormal];
                [weakSelf.codeButton setTitle:[NSString stringWithFormat:@"(%zds)",(long)timeout] forState:UIControlStateNormal];
                 [weakSelf.codeButton setTitleColor:K_HColor forState:UIControlStateNormal];
                [UIView commitAnimations];
                sender.userInteractionEnabled = NO;
            });
            timeout--;
        }
    });
    dispatch_resume(_timer);
}


//注册返回
- (void)registerAndBack {
    if (_styleType == LoginInputStyleTypePassLogin || _styleType == LoginInputStyleTypeCodeLogin) {
        RegisterViewController *vc= [RegisterViewController new];
        [self.viewController.navigationController pushViewController:vc animated:YES];
    }
    
    if (_styleType == LoginInputStyleTypeRegisterCode || _styleType == LoginInputStyleTypeRegisterPass) {
        [self.viewController.navigationController popViewControllerAnimated:YES];
    }
}

@end
