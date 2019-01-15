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
        _top = [UIImageView new];
        [self.contentView addSubview:_top];
        [_top mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@15);
            make.right.equalTo(@-15);
            make.height.equalTo(@100);
        }];
        
        _name = [UILabel new];
        _name.backgroundColor = [UIColor blackColor];
        [self.contentView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.top);
            make.top.equalTo(self.top.mas_bottom).offset(5);
        }];
        
        _disLabel = [UILabel new];
        [self.contentView addSubview:_disLabel];
        [_disLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.name);
            make.top.equalTo(self.name.mas_bottom).offset(5);
            make.bottom.equalTo(self.contentView).offset(-5);
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
