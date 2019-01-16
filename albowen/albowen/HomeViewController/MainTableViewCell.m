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
            make.height.equalTo(self.contentView.mas_width).multipliedBy(.5);
        }];
       
        sdc.imageURLStringsGroup = @[@"http://p2-q.mafengwo.net/s10/M00/9F/EA/wKgBZ1mIb0OAA50wAAIdaeBF-i416.jpeg?imageMogr2%2Fthumbnail%2F%21660x480r%2Fgravity%2FCenter%2Fcrop%2F%21660x480%2Fquality%2F90",@"http://p4-q.mafengwo.net/s6/M00/B2/BE/wKgB4lMDacGAPLq7AAKizs4AHDw28.jpeg?imageMogr2%2Fthumbnail%2F%21300x240r%2Fgravity%2FCenter%2Fcrop%2F%21300x240%2Fquality%2F90"];
    }
    
    return self;
}
@end
