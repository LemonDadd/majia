//
//  MapTableViewCell.m
//  albowen
//
//  Created by 关云秀 on 2019/1/18.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "MapTableViewCell.h"

@interface MapTableViewCell()

@property (nonatomic, strong)UILabel *dianhua;
@property (nonatomic, strong)UIImageView *dianhuaImage;

@end


@implementation MapTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        UIImageView *rom = [UIImageView new];
        rom.image = [UIImage imageNamed:@"techreport"];
        [self.contentView addSubview:rom];
        [rom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(10);
            make.bottom.equalTo(self.contentView).offset(-10);
            make.width.height.equalTo(@30);
        }];
        
        _dianhua = [UILabel new];
        _dianhua.text = @"เริ่มต้นนำร่อง";
        _dianhua.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_dianhua];
        [_dianhua mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(rom);
            make.left.equalTo(rom.mas_right).offset(5);
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
