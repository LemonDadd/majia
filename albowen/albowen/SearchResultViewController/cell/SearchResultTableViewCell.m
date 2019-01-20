//
//  SearchResultTableViewCell.m
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchResultTableViewCell.h"

@interface SearchResultTableViewCell()


@end

@implementation SearchResultTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _leftImageView = [UIImageView new];
        _leftImageView.backgroundColor = K_HColor;
        [self.contentView addSubview:_leftImageView];
        [_leftImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.contentView);
            make.height.equalTo(@100);
            make.width.equalTo(self.leftImageView.mas_height).multipliedBy(1.5);
        }];
        
        _countLabel = [UILabel new];
        _countLabel.text = @"124";
        _countLabel.textColor = [UIColor whiteColor];
        _countLabel.font = KFONT(15);
        [self.contentView addSubview:_countLabel];
        [_countLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.leftImageView).offset(10);
            make.right.equalTo(self.leftImageView).offset(-10);
        }];
        
        _countImageV = [UIImageView new];
        _countImageV.image = [UIImage imageNamed:@"mv_serch_time"];
        [self.contentView addSubview:_countImageV];
        [_countImageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.countLabel);
            make.right.equalTo(self.countLabel.mas_left).offset(-5);
        }];
        
        _nameLabel = [UILabel new];
        _nameLabel.font = KFONT(15);
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.leftImageView.mas_right).offset(10);
            make.right.equalTo(self.contentView).offset(-10);
            make.centerY.equalTo(self.leftImageView).offset(-10);
        }];
        
        _detailLabel = [UILabel new];
        _detailLabel.font = KFONT(15);
        _detailLabel.textColor=K_HColor;
        [self.contentView addSubview:_detailLabel];
        [_detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameLabel.mas_bottom).offset(5);
            make.left.right.equalTo(self.nameLabel);
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
