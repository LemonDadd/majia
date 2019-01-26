//
//  GoogleMapTableViewCell.m
//  albowen
//
//  Created by quanqiuwa on 2019/1/26.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "GoogleMapTableViewCell.h"

@interface GoogleMapTableViewCell ()<CLLocationManagerDelegate,GMSMapViewDelegate>

@property (nonatomic,strong) GMSMapView *mapView;//地图
@property (nonatomic,strong) GMSMarker *marker;//大头针

@end

@implementation GoogleMapTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:-23.12960481
                                                                longitude:113.30887721
                                                                     zoom:10];
        self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
        self.mapView.delegate = self; //注册代理属性
        self.mapView.settings.compassButton = YES;//显示指南针
        [self.contentView addSubview:self.mapView];
        [self.mapView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView);
            make.height.equalTo(@200);
        }];
    }
    return self;
}

- (void)setModel:(ResourceClass *)model {
    _model = model;
  
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[_model.lat floatValue]
                                                            longitude:[_model.lng floatValue]
                                                                 zoom:18];
    self.mapView.camera = camera;
     CLLocationCoordinate2D coords = CLLocationCoordinate2DMake([_model.lat floatValue], [_model.lng floatValue]);
    self.marker = [GMSMarker markerWithPosition:coords];
    self.marker.map = self.mapView;
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
