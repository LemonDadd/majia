//
//  ScrTableViewCell.m
//  albowen
//
//  Created by 关云秀 on 2019/1/17.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "ScrTableViewCell.h"

@implementation ScrTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _sdc = [[SDCycleScrollView alloc]initWithFrame:CGRectZero];
        _sdc.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        [self.contentView addSubview:_sdc];
        [_sdc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
            make.height.equalTo(self.contentView.mas_width).multipliedBy(.6);
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
