//
//  BaseTabBarController.m
//  albowen
//
//  Created by 关云秀 on 2019/1/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "BaseTabBarController.h"
#import "HomeViewController.h"
#import "MVClassController.h"
#import "SearchViewController.h"
#import "UserViewController.h"
#import "BaseNavigationController.h"


@interface BaseTabBarController ()

@end

@implementation BaseTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    // Do any additional setup after loading the view.
    HomeViewController *home = [HomeViewController new];
    [self addChildVc:home title:@"ที่หน้าแรก" image:@"home_icon" selectedImage:@"home_icon_true"];
    
    MVClassController *guide = [MVClassController new];
    [self addChildVc:guide title:@"รายชื่อ" image:@"zhdl_icon" selectedImage:@"zhdl_icon_true"];
    
    SearchViewController *interact = [SearchViewController new];
    [self addChildVc:interact title:@"ค้นหา" image:@"tyhd_icon" selectedImage:@"tyhd_icon_true"];
    
    //    StaffViewController *staff = [StaffViewController new];
    //    [self addChildViewControllerByController:staff Title:@"首页" Image:nil];
    
    UserViewController *mine = [UserViewController new];
    [self addChildVc:mine title:@"ฉัน" image:@"mine_icon" selectedImage:@"mine_icon_true"];
}

- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 设置子控制器的图片
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    if ([[[UIDevice currentDevice] systemVersion] doubleValue] >= 7.0) {
        childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    } else {
        childVc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
        childVc.tabBarItem.image = [UIImage imageNamed:image];
    }
    
    
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] =[UIColor colorWithNumber:0x3a3a3a];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    selectTextAttrs[NSForegroundColorAttributeName] =[UIColor colorWithNumber:0X804000];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    

    // 先给外面传进来的小控制器 包装 一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    // 添加为子控制器
    [self addChildViewController:nav];
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
