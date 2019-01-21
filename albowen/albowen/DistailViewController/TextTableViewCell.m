//
//  TextTableViewCell.m
//  albowen
//
//  Created by quanqiuwa on 2019/1/21.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "TextTableViewCell.h"

@implementation TextTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        _title = [UILabel new];
        _title.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_title];
        [_title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(@5);
            make.left.equalTo(@15);
            make.right.equalTo(@-15);

        }];
        
        
        _text = [UILabel new];
        _text.numberOfLines = 0;
        _text.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_text];
        [_text mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.title.mas_bottom).offset(10);
            make.left.right.equalTo(self.title);
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
