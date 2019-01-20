//
//  MVCollectionViewCell.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "MVCollectionViewCell.h"

@interface MVCollectionViewCell()

@property (nonatomic, strong)UIImageView *bgImageView;
@property (nonatomic, strong)UIImageView *picImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *locationLabel;
@property (nonatomic, strong)UILabel *titleLabel;
@property (nonatomic, strong)UIButton *userButton;



@end

@implementation MVCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _bgImageView = [UIImageView new];
        _bgImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        [self.contentView addSubview:_bgImageView];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
        }];
        
        _picImageView = [UIImageView new];
        _picImageView.layer.masksToBounds = YES;
        _picImageView.layer.cornerRadius = 10.f;
        [self.contentView addSubview:_picImageView];
        [_picImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView).offset(-5);
            make.left.equalTo(self.contentView).offset(5);
            make.width.height.equalTo(@20);
        }];
        
        _nameLabel = [UILabel new];
        _nameLabel.textColor = [UIColor whiteColor];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_nameLabel];
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.picImageView);
            make.left.equalTo(self.picImageView.mas_right).offset(8);
        }];
        
        _locationLabel = [UILabel new];
        _locationLabel.textColor = [UIColor whiteColor];
        _locationLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_locationLabel];
        [_locationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.contentView).offset(-5);
            make.centerY.equalTo(self.nameLabel);
        }];
        
        
        _titleLabel = [UILabel new];
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.numberOfLines = 0;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.picImageView);
            make.right.equalTo(self.locationLabel);
            make.bottom.equalTo(self.picImageView.mas_top).offset(-8);
        }];
        
        _userButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _userButton.backgroundColor = [UIColor clearColor];
        [self.contentView addSubview:_userButton];
        [_userButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.bottom.equalTo(self.picImageView);
            make.right.equalTo(self.nameLabel);
        }];
    }
    return self;
}

- (void)setModel:(MvListModel *)model {
    _model = model;
    [_bgImageView sd_setImageWithURL:[NSURL URLWithString:model.img] placeholderImage:Def];
    [_picImageView sd_setImageWithURL:[NSURL URLWithString:model.headimg] placeholderImage:Def];
    _nameLabel.text = model.user;
    _locationLabel.text = model.address;
    _titleLabel.text = model.title;
}

@end
