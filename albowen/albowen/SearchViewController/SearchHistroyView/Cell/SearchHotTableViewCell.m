//
//  SearchHotTableViewCell.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchHotTableViewCell.h"

@interface SearchHotTableViewCell()

@property (nonatomic, strong)UIView *content;

@end

@implementation SearchHotTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = KCOLOR(245, 245, 245);
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        _content = [UIView new];
        [self.contentView addSubview:_content];
        [_content mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.equalTo(@8);
            make.bottom.right.equalTo(@-8);
        }];
    }
    return self;
}

-(void)setAllResource:(NSArray *)allResource {
    _allResource = allResource;
    [self setHotTip:_allResource];
}

- (void)setHotTip:(NSArray *)allRessour {

    for (UIView *v in self.content.subviews) {
        [v removeFromSuperview];
    }
    
    //标签相对父视图左边距
    CGFloat leftMarginLabel = 0;
    //标签相对父视图顶部距离
    CGFloat topMarginLabel =  0;
    //标签左右间距
    CGFloat horizontalSpace = 10;
    //标签上下间距
    CGFloat verticalSpace = 10;
    //标签的高度
    CGFloat labelHeight = 25;
    
    
    //下面这几个值不需要做修改
    //最大宽度，超过这个宽度就要换行
    CGFloat windthMax = (KSCREEN_WIDTH-16) - leftMarginLabel * 2;
    //标签的起始X坐标（下面动态变化）
    CGFloat labelMinX = leftMarginLabel;
    //标签的起始Y坐标（下面动态变化）
    CGFloat labelMimY = topMarginLabel;
    //记录最后一个标签的最大Y，用来布局父视图
    UIView *lastV = nil;
    for (int i = 0; i < allRessour.count; i++) {
        UIButton* labelButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [labelButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        //根据文字计算标签的宽度，后面会多加上一点宽度，视情况而定
        NSDictionary * attributes = @{NSFontAttributeName:[UIFont systemFontOfSize:15]};
        CGFloat labelWidth = [allRessour[i] boundingRectWithSize:CGSizeMake(FLT_MAX, FLT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil].size.width + 40;
        //为标签赋值
        [labelButton setTitle:[NSString stringWithFormat:@"%@",allRessour[i]] forState:UIControlStateNormal];
        //设置标签的frame
        labelButton.frame = CGRectMake(labelMinX, labelMimY, labelWidth, labelHeight);
        labelButton.layer.masksToBounds = YES;
        labelButton.layer.cornerRadius =labelHeight/2;
        labelButton.layer.borderColor = [UIColor blackColor].CGColor;
        labelButton.layer.borderWidth =1.f;
        
        //当标签的位置超出屏幕边缘时换行（超出限制的最大宽度）
        if(labelMinX + labelWidth + horizontalSpace > windthMax){
            //换行时将w置为起始坐标
            labelMinX = leftMarginLabel;
            //距离父视图也变化
            labelMimY = labelMimY + labelButton.frame.size.height + verticalSpace;
            //重设button的frame
            labelButton.frame = CGRectMake(labelMinX, labelMimY, labelWidth, labelHeight);
        }
        //多加的是两个标签之间的水平距离
        labelMinX = labelButton.frame.size.width + labelButton.frame.origin.x + horizontalSpace;
        labelButton.titleLabel.font = [UIFont systemFontOfSize:14];
        labelButton.tag = i+100;
        //标签的点击事件
        [labelButton addTarget:self action:@selector(labelButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        [_content addSubview:labelButton];
        
        if (i==allRessour.count-1) {
            //拿到最后一个标签的位置
            lastV = labelButton;
        }
    }
    
    //布局
    [_content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(lastV);
    }];
}

- (void)labelButtonAction:(UIButton *)btn
{
    NSString *title = _allResource[btn.tag-100];
    if (_hotTipDidSeletd) {
        _hotTipDidSeletd(title);
    }
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
