//
//  NameTableViewCell.m
//  albowen
//
//  Created by 关云秀 on 2019/1/17.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "NameTableViewCell.h"

#define degreesToRadians(x) (M_PI*(x)/180.0) //把角度转换成PI的方式
#define  PROGREESS_WIDTH 80 //圆直径
#define PROGRESS_LINE_WIDTH 4 //弧线的宽度

@interface NameTableViewCell()

@property (nonatomic, strong)UILabel *name;
@property (nonatomic, strong)UILabel *dis;
@property (nonatomic, strong)UILabel *fen;

@property (nonatomic, strong)CAShapeLayer *progressLayer;

@end

@implementation NameTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _fen = [UILabel new];
        _fen.textAlignment = NSTextAlignmentCenter;
        _fen.font = [UIFont boldSystemFontOfSize:20];
        _fen.numberOfLines = 2;
        [self.contentView addSubview:_fen];
        [_fen mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView).offset(10);
            make.right.bottom.equalTo(self.contentView).offset(-10);
            make.width.height.equalTo(@80);
        }];
        
        _name = [UILabel new];
        _name.font = [UIFont systemFontOfSize:18];
        [self.contentView addSubview:_name];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@10);
            make.right.equalTo(self.fen.mas_left).offset(-30);
        }];
        
        _dis = [UILabel new];
        _dis.font = [UIFont systemFontOfSize:15];
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
    CGFloat v = [model.fenshu floatValue] /10.0;
    KWeakSelf;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self setlayer];
        [self setPercentByValue:v Animated:YES];
        weakSelf.fen.text = [NSString stringWithFormat:@"评分\n%@",model.fenshu];
    });
}

- (void)setlayer {
    CAShapeLayer *trackLayer = [CAShapeLayer layer];//创建一个track shape layer
    trackLayer.frame = _fen.bounds;
    [_fen.layer addSublayer:trackLayer];
    trackLayer.fillColor = [[UIColor clearColor] CGColor];
    trackLayer.strokeColor = [K_H_TextCOLOR CGColor];//指定path的渲染颜色
    trackLayer.lineCap = kCALineCapRound;//指定线的边缘是圆的
    trackLayer.lineWidth = PROGRESS_LINE_WIDTH;//线的宽度
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(40, 40) radius:(PROGREESS_WIDTH-PROGRESS_LINE_WIDTH)/2 startAngle:degreesToRadians(-210) endAngle:degreesToRadians(30) clockwise:YES];//上面说明过了用来构建圆形
    trackLayer.path =[path CGPath];
    
    _progressLayer = [CAShapeLayer layer];
    _progressLayer.frame = _fen.bounds;
    [_fen.layer addSublayer:_progressLayer];
    _progressLayer.fillColor =  [[UIColor clearColor] CGColor];
    _progressLayer.strokeColor  = [[UIColor colorWithNumber:MCOLOR] CGColor];
    _progressLayer.lineCap = kCALineCapRound;
    _progressLayer.lineWidth = PROGRESS_LINE_WIDTH;
    _progressLayer.path = [path CGPath];
    _progressLayer.strokeEnd = 0;
}


-(void)setPercentByValue:(CGFloat)value Animated:(BOOL)animated
{
    [CATransaction begin];
    [CATransaction setDisableActions:!animated];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:1];
    _progressLayer.strokeEnd = value;
    
    [CATransaction commit];
    [self layoutSubviews];
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
