//
//  NameTableViewCell.m
//  albowen
//
//  Created by 关云秀 on 2019/1/17.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "NameTableViewCell.h"

@interface NameTableViewCell()

@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *dis;
@property (nonatomic, strong)UIView *fen;

@end

@implementation NameTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _fen = [UIView new];
        [self.contentView addSubview:_fen];
        [_fen mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(10);
            make.right.bottom.equalTo(self.contentView).offset(-10);
            make.width.height.equalTo(@80);
        }];
        
        _name = [UILabel new];
        _name.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
            make.right.equalTo(self.fen.mas_left).offset(-30);
        }];
        
        _dis = [UILabel new];
        _dis.font = [UIFont systemFontOfSize:13];
        _dis.numberOfLines =2;
        [self.contentView addSubview:_dis];
        [_dis mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.fen);
            make.left.right.equalTo(self.name);
        }];
    }
    
    return self;
}

-(void)setModel:(ResourceClass *)model {
    
    _model = model;
    _name.text = model.name;
    _dis.text = model.dis;
    
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
