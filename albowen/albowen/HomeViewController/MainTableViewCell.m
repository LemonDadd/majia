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
       
        sdc.imageURLStringsGroup = @[@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548052781714&di=09afe500c39861bd30aa4c8710d8891b&imgtype=0&src=http%3A%2F%2Fb2-q.mafengwo.net%2Fs11%2FM00%2F01%2F76%2FwKgBEFt2m0GAaVwGAAdprkVwQek16.jpeg%3FimageView2%2F2%2Fw%2F680%2Fq%2F90",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548052781713&di=7005c58f6b05d987294bb46614acd1c3&imgtype=0&src=http%3A%2F%2Fpimg.mangocity.com%2Fvimg%2Ftrip%2F10525718_713255962252053.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548647561&di=8b94c904d36ba30e41c8ccffea3626a1&imgtype=jpg&er=1&src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170803%2Fad3a3db68ceb4454a3963a644d7c54ee_th.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548052894116&di=eb66b2e3428e45a80d5e38bbac712f86&imgtype=0&src=http%3A%2F%2Fyouimg1.c-ctrip.com%2Ftarget%2Ftg%2F011%2F172%2F622%2Fd900bb55dcbe458b8e863101ba71a831.jpg",@"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1548052894115&di=e248528b6a30d1c70143afe7f237157c&imgtype=0&src=http%3A%2F%2Fspider.nosdn.127.net%2F6acf088b838db2a9994a07b1591bc41e.jpeg"];
    }
    
    return self;
}
@end
