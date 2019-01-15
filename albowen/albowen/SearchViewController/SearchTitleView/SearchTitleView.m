//
//  SearchTitleView.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchTitleView.h"

@interface SearchTitleView()<UITextFieldDelegate>

@end

@implementation SearchTitleView

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        UIView *bg = [UIView new];
        [self addSubview:bg];
        bg.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
        bg.layer.cornerRadius = 5;
        bg.layer.masksToBounds = YES;
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(@10);
            make.right.bottom.equalTo(@-10);
        }];
        
        
        UITextField *textField = [UITextField new];
        textField.placeholder = @"搜索MV";
        textField.delegate =self;
        textField.returnKeyType = UIReturnKeyDone;
        textField.font = KFONT(15);
        textField.textColor = [UIColor whiteColor];
        textField.tintColor = [UIColor whiteColor];
        [textField addTarget:self action:@selector(textFieldDidEditing:) forControlEvents:UIControlEventEditingChanged];
        [bg addSubview:textField];
        [textField mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@8);
            make.right.equalTo(@-8);
            make.top.bottom.equalTo(@0);
        }];
        
    }
    return self;
}

- (CGSize)intrinsicContentSize {
    return UILayoutFittingExpandedSize;
}

- (void)textFieldDidEditing:(UITextField *)textField {
    if (_delegate && [_delegate respondsToSelector:@selector(searchWithStr:)]) {
        [_delegate searchWithStr:textField.text];
    }
}

/*! 点击键盘搜索按钮的回调 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if (_delegate && [_delegate respondsToSelector:@selector(searchWithStr:)]) {
        [_delegate searchWithStr:textField.text];
    }
    return YES;
}

@end
