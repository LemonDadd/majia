//
//  SearchHistroyTableViewCell.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchHistroyTableViewCell.h"

@interface SearchHistroyTableViewCell()


@end

@implementation SearchHistroyTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = KCOLOR(245, 245, 245);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _leftImageView = [UIImageView new];
        _leftImageView.image = [UIImage imageNamed:@"search_time_ico"];
        [self.contentView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.height.equalTo(@15);
            make.centerY.equalTo(self.contentView);
            make.left.equalTo(self.contentView).offset(10);
        }];
        
        _delBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_delBtn setImage:[UIImage imageNamed:@"Close_small"] forState:UIControlStateNormal];
        [self.contentView addSubview:_delBtn];
        [_delBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.height.width.equalTo(self.leftImageView);
            make.right.equalTo(self.contentView).offset(-10);
        }];
        
        _songLabel = [UILabel new];
        _songLabel.font = [UIFont systemFontOfSize:12];
        _songLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:_songLabel];
        [_songLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImageView.mas_right).offset(10);
            make.centerY.equalTo(self.leftImageView);
        }];
        
        _line = [UIView new];
        _line.backgroundColor = K_HColor;
        [self.contentView addSubview:_line];
        [_line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.contentView);
            make.height.equalTo(@.5);
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
