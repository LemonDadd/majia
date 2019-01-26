//
//  PriceTableViewCell.m
//  albowen
//
//  Created by quanqiuwa on 2019/1/26.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "PriceTableViewCell.h"

@implementation PriceTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        _imageV = [UIImageView new];
        [self.contentView addSubview:_imageV];
        [_imageV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
            make.height.width.equalTo(@30);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        
        _name = [UILabel new];
        [self.contentView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.imageV.mas_right).offset(10);
            make.centerY.equalTo(self.imageV);
        }];
        
        _priceLabel = [UILabel new];
        _priceLabel.textColor = [UIColor colorWithNumber:MCOLOR];
        [self.contentView addSubview:_priceLabel];
        [_priceLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-10);
            make.centerY.equalTo(self.imageV);
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
