//
//  MVTieleView.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "MVTieleView.h"

#define viewTag 2000

@interface MVTieleView()

@property (nonatomic, strong)UIView *line;

@end

@implementation MVTieleView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftBtn.tag = 0+viewTag;
        [leftBtn setTitle:@"精选" forState:UIControlStateNormal];
        [leftBtn addTarget:self action:@selector(titleEvient:) forControlEvents:UIControlEventTouchUpInside];
        [leftBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self addSubview:leftBtn];
        [leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self);
            make.width.equalTo(self).multipliedBy(.5);
        }];
        
        UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightBtn.tag = 1+viewTag;
        [rightBtn setTitle:@"推荐" forState:UIControlStateNormal];
        [rightBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [rightBtn addTarget:self action:@selector(titleEvient:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:rightBtn];
        [rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.top.bottom.equalTo(self);
            make.width.equalTo(leftBtn);
        }];
        
        _line = [UIView new];
        _line.backgroundColor = [UIColor whiteColor];
        [self addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(leftBtn);
            make.width.equalTo(leftBtn).multipliedBy(.4);
            make.height.equalTo(@2);
            make.bottom.equalTo(self);
        }];
        
    }
    return self;
}

- (void)titleEvient:(UIButton *)sender {
    if (_seletedItem) {
        _seletedItem(sender.tag-viewTag);
    }
}

- (void)setIndx:(NSInteger)indx {
    UIButton *btn = [self viewWithTag:indx+viewTag];
    [UIView animateWithDuration:0.1 animations:^{
        [self.line mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btn);
            make.width.equalTo(btn).multipliedBy(.4);
            make.height.equalTo(@2);
            make.bottom.equalTo(self);
        }];
        [self layoutIfNeeded];
    }];
}


- (CGSize)intrinsicContentSize {
    return UILayoutFittingExpandedSize;
}

@end
