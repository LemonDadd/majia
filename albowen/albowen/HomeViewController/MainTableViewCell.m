//
//  MainTableViewCell.m
//  ExpressLittleBrother
//
//  Created by keneng17 on 2017/2/16.
//  Copyright © 2017年 niuhongfei. All rights reserved.
//

#import "MainTableViewCell.h"


@interface MainTableViewCell()

@end

@implementation MainTableViewCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        SDCycleScrollView *sdc = [[SDCycleScrollView alloc]initWithFrame:CGRectZero];
        [self.contentView addSubview:sdc];
        [sdc mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
            make.height.equalTo(self.contentView.mas_width);
        }];
       
        sdc.imageURLStringsGroup = @[@"http://h2.bytravel.cn/www/44/head/43712.gif",@"http://h2.bytravel.cn/www/44/head/43712.gif",@"http://h2.bytravel.cn/www/44/head/43712.gif",@"http://h2.bytravel.cn/www/44/head/43712.gif"];
    }
    
    return self;
}
@end
