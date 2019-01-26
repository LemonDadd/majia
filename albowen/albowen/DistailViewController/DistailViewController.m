//
//  DistailViewController.m
//  albowen
//
//  Created by 关云秀 on 2019/1/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "DistailViewController.h"
#import "ScrTableViewCell.h"
#import "NameTableViewCell.h"
#import "SubscribeViewController.h"
#import "TimeTableViewCell.h"
#import "PhoneTableViewCell.h"
#import "MapTableViewCell.h"
#import <MapKit/MapKit.h>
#import "TextTableViewCell.h"
#import <CoreLocation/CoreLocation.h>
#import "GoogleMapTableViewCell.h"
#import "PriceTableViewCell.h"

@interface DistailViewController ()<UITableViewDelegate,UITableViewDataSource,CLLocationManagerDelegate>

@property (nonatomic, strong)UITableView *tableView;

@property (strong, nonatomic) CLLocationManager *manager;

@property (nonatomic, assign)  double currentLatitude;

@property (nonatomic, assign)  double currentLongitute;

@end

@implementation DistailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"รายละเอียด";
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@""] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(shouc:) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    

    _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
    _tableView.dataSource =self;
    _tableView.delegate =self;
    _tableView.backgroundColor = K_View_BGColor;
    _tableView.estimatedRowHeight =300;
    [self.view addSubview:_tableView];
    [_tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.equalTo(self.view);
    }];
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    view.backgroundColor = [UIColor clearColor];
    UIButton *bottom = [UIButton buttonWithType:UIButtonTypeCustom];
    [bottom setBackgroundColor:[UIColor colorWithNumber:MCOLOR]];
    [bottom setTitleColor:[UIColor whiteColor] forState: UIControlStateNormal];
    [bottom setTitle:@"การนัดหมาย" forState:UIControlStateNormal];
    [bottom addTarget:self action:@selector(btnEVENT) forControlEvents:UIControlEventTouchUpInside];
    [view addSubview:bottom];
    bottom.layer.cornerRadius =25;
    bottom.layer.masksToBounds = YES;
    [bottom mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(view);
        make.height.equalTo(@50);
        make.width.equalTo(view).multipliedBy(.5);
    }];
    
    _tableView.tableFooterView = view;
    
    _manager = [[CLLocationManager alloc] init];
    [_manager requestWhenInUseAuthorization];//申请定位服务权限
    _manager.delegate = self;
     //设置定位精度
     _manager.desiredAccuracy = kCLLocationAccuracyBest;
     //定位频率,每隔多少米定位一次
    CLLocationDistance distance = 10.0;//十米定位一次
    _manager.distanceFilter = distance;
}


//代理方法

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
        //获取定位的坐标
    CLLocation *location = [locations firstObject];
    CLLocationCoordinate2D coordinate = location.coordinate;
    _currentLongitute = coordinate.longitude;
    _currentLatitude = coordinate.latitude;
    [_manager stopUpdatingLocation];
    // 起点
    MKMapItem *currentLocation = [[MKMapItem alloc] initWithPlacemark:[[MKPlacemark alloc] initWithCoordinate: CLLocationCoordinate2DMake(_currentLatitude, _currentLongitute) addressDictionary: nil]];
    currentLocation.name = @"ตำแหน่งของฉัน";
    // 目的地的位置
    CLLocationCoordinate2D coords = CLLocationCoordinate2DMake([_model.lat floatValue], [_model.lng floatValue]);
    MKMapItem *toLocation = [[MKMapItem alloc] initWithPlacemark: [[MKPlacemark alloc] initWithCoordinate:coords addressDictionary:nil]];
    toLocation.name = _model.name;
    
    NSArray *items = [NSArray arrayWithObjects:currentLocation, toLocation, nil];
    NSDictionary *options = @{ MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving, MKLaunchOptionsMapTypeKey: [NSNumber numberWithInteger:MKMapTypeStandard], MKLaunchOptionsShowsTrafficKey: @YES };
    
    // 打开苹果地图应用，并呈现指定的item
    [MKMapItem openMapsWithItems:items launchOptions:options];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error

{
    [CustomView alertMessage:@"รับความล้มเหลวในตำแหน่ง" view:self.view];
}
- (void)btnEVENT {
    
    if ([UserInfoClass getUserInfoClass]  == nil) {
          [(BaseViewController *)self gotoLoginViewController];
        return;
    }
    SubscribeViewController *vc = [SubscribeViewController new];
    vc.model = _model;
    [self.navigationController pushViewController:vc animated:YES];
    
  
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 9;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 3) {
        return _model.fangjia.count;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section ==0) {
        ScrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ScrTableViewCell"];
        if (cell == nil) {
            cell = [[ScrTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ScrTableViewCell"];
        }
        cell.sdc.imageURLStringsGroup = _model.imageList;
        return cell;
    }
    if (indexPath.section ==1) {
        NameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NameTableViewCell"];
        if (cell == nil) {
            cell = [[NameTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"NameTableViewCell"];
        }
        cell.model = _model;
        return cell;
    }
    
    if (indexPath.section ==2) {
        TimeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeTableViewCell"];
        if (cell == nil) {
            cell = [[TimeTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TimeTableViewCell"];
        }
        cell.model = _model;
        return cell;
    }
    
    if (indexPath.section ==3) {
        PriceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"PriceTableViewCell"];
        if (cell == nil) {
            cell = [[PriceTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"PriceTableViewCell"];
        }
        fangjiaClass *fangjia = [fangjiaClass mj_objectWithKeyValues:_model.fangjia[indexPath.row]];
        cell.name.text =fangjia.name;
        cell.imageV.image = [UIImage imageNamed:fangjia.image];
        cell.priceLabel.text = fangjia.price;
        return cell;
    }
    
    if (indexPath.section ==4) {
        MapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MapTableViewCell"];
        if (cell == nil) {
            cell = [[MapTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MapTableViewCell"];
        }
        return cell;
    }
    
    if (indexPath.section ==5) {
        GoogleMapTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoogleMapTableViewCell"];
        if (cell == nil) {
            cell = [[GoogleMapTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"GoogleMapTableViewCell"];
        }
        cell.model = self.model;
        return cell;
    }
    
    if (indexPath.section ==6 || indexPath.section ==7||indexPath.section ==8) {
        TextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TextTableViewCell"];
        if (cell == nil) {
            cell = [[TextTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"TextTableViewCell"];
        }
        
        if (indexPath.section ==6) {
            cell.title.text = @"การขนส่ง";
            cell.text.text = _model.jiaotong;
        } else if (indexPath.section ==7) {
            cell.title.text = @"ครอบครัว";
            cell.text.text = _model.fangxing;
        } else if (indexPath.section ==8) {
            cell.title.text = @"สิ่งอํานวยความสะดวก";
            cell.text.text = _model.sheshi;
        }
        
        return cell;
    }
    return [UITableViewCell new];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.section ==4) {
        [_manager startUpdatingLocation];
    }
    
}


- (void)shouc:(UIButton *)sender {
    sender.selected = !sender.selected;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
