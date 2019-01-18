//
//  TimeTableViewCell.m
//  albowen
//
//  Created by 关云秀 on 2019/1/17.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "TimeTableViewCell.h"

@interface TimeTableViewCell()

@property (nonatomic, strong)UILabel *ruzhu;
@property (nonatomic, strong)UILabel *lidian;

@property (nonatomic, strong)UILabel *fangjian;

@end

@implementation TimeTableViewCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _ruzhu = [UILabel new];
        _ruzhu.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_ruzhu];
        [_ruzhu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(10);
        }];
        
        _lidian = [UILabel new];
        _lidian.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_lidian];
        [_lidian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.ruzhu.mas_bottom).offset(8);
            make.left.equalTo(self.ruzhu);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        _fangjian = [UILabel new];
        _fangjian.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_fangjian];
        [_fangjian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-10);
            make.top.equalTo(self.ruzhu);
        }];
        
        
        UIImageView *rom = [UIImageView new];
        [self.contentView addSubview:rom];
        [rom mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.fangjian);
            make.right.equalTo(self.fangjian.mas_left).offset(-5);
        }];
    }
    
    return self;
}
-(void)setModel:(ResourceClass *)model {
    _model = model;
    _ruzhu.text = [NSString stringWithFormat:@"入住时间:%@",model.ruzhu];
    _lidian.text = [NSString stringWithFormat:@"离店时间:%@",model.lidian];
    _fangjian.text =[NSString stringWithFormat:@"%@房间",model.fangjian];
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
