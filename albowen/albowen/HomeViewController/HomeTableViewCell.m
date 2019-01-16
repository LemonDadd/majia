//
//  HomeTableViewCell.m
//  albowen
//
//  Created by 关云秀 on 2019/1/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = [UIColor clearColor];
        
        _top = [UIImageView new];
        _top.layer.cornerRadius =8;
        _top.layer.masksToBounds = YES;
        [self.contentView addSubview:_top];
        [_top mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
            make.right.equalTo(@-10);
            make.bottom.equalTo(self.contentView);
            make.height.equalTo(@200);
        }];
        
        
        UIView *view = [UIView new];
        view.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        [_top addSubview:view];
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.top);
            make.bottom.equalTo(self.top);
        }];
        
        _name = [UILabel new];
        _name.textColor = [UIColor whiteColor];
        _name.font = [UIFont systemFontOfSize:15];
        [view addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.equalTo(view).offset(5);
            make.right.equalTo(view).offset(-5);
        }];
        
        _disLabel = [UILabel new];
        _disLabel.textColor = [UIColor whiteColor];
        _disLabel.font = [UIFont systemFontOfSize:12];
        _disLabel.numberOfLines = 2;
        [self.contentView addSubview:_disLabel];
        [_disLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.name);
            make.bottom.equalTo(view).offset(-5);
            make.top.equalTo(self.name.mas_bottom).offset(5);
        }];
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
