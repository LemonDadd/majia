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
        
        UIImageView *a = [UIImageView new];
        a.image = [UIImage imageNamed:@"haofangtuo"];
        [self.contentView addSubview:a];
        [a mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(self.contentView).offset(10);
        }];
        
        _ruzhu = [UILabel new];
        _ruzhu.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_ruzhu];
        [_ruzhu mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(a);
            make.left.equalTo(a.mas_right).offset(5);
        }];
        
        
        UIImageView *b = [UIImageView new];
        b.image = [UIImage imageNamed:@"lidianshijian"];
        [self.contentView addSubview:b];
        [b mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(a);
            make.top.equalTo(a.mas_bottom).offset(8);
            make.bottom.equalTo(self.contentView).offset(-10);
        }];
        
        _lidian = [UILabel new];
        _lidian.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_lidian];
        [_lidian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.ruzhu);
            make.centerY.equalTo(b);
        }];
        
        _fangjian = [UILabel new];
        _fangjian.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_fangjian];
        [_fangjian mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-10);
            make.top.equalTo(self.ruzhu);
        }];
        
        
        UIImageView *rom = [UIImageView new];
        rom.image = [UIImage imageNamed:@"fangjian"];
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
    _ruzhu.text = [NSString stringWithFormat:@"เวลาเช็คอิน:%@",model.ruzhu];
    _lidian.text = [NSString stringWithFormat:@"ออกจากเวลา:%@",model.lidian];
    _fangjian.text =[NSString stringWithFormat:@"%@ห้อง",model.fangjian];
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
