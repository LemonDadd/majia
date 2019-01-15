//
//  SearchHeaderView.m
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchHeaderView.h"

@implementation SearchHeaderView

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithReuseIdentifier:reuseIdentifier];
    if (self) {
        UIView *bg = [UIView new];
        bg.backgroundColor = KCOLOR(245, 245, 245);
        [self.contentView   addSubview:bg];
        [bg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        _titleLabel = [UILabel new];
        _titleLabel.font = KFONT(12);
        _titleLabel.textColor = [UIColor blackColor];
        [bg addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@10);
            make.bottom.equalTo(bg);
        }];
    }
    return self;
}

@end
