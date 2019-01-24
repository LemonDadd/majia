//
//  TaiLandViewController.m
//  albowen
//
//  Created by quanqiuwa on 2019/1/24.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "TaiLandViewController.h"

@interface TaiLandViewController ()

@property (nonatomic, strong)UIWebView *loc;

@end

@implementation TaiLandViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    
    UIView  *bottomView = [UIView new];
    bottomView.backgroundColor =[UIColor colorWithNumber:0xd8d8d8];
    [self.view addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.view);
        make.height.equalTo(@44);
    }];
    
    if (_yc.length) {
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.equalTo(@0);
        }];
    } else {
        [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(self.view);
            make.height.equalTo(@44);
        }];
        NSArray *images = @[@"zuo",@"you",@"shuaxin",@"jia"];
        NSMutableArray *btns = [NSMutableArray new];
        for (int i=0; i<images.count; i++) {
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            [btn setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
            [bottomView addSubview:btn];
            [btns addObject:btn];
            btn.tag = i;
            [btn addTarget:self action:@selector(btnSeleted:) forControlEvents:UIControlEventTouchUpInside];
        }
        
        [btns mas_distributeViewsAlongAxis:MASAxisTypeHorizontal withFixedSpacing:20 leadSpacing:20 tailSpacing:20];
        [btns mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(bottomView);
        }];
    }
    
    _loc = [UIWebView new];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.str]];
    _loc.scrollView.bounces = NO;
    [_loc loadRequest:request];
    [self.view addSubview:_loc];
    [_loc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@22);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(bottomView.mas_top);
    }];
}

- (void)btnSeleted:(UIButton *)sender {
    if (sender.tag == 0) {
        if (_loc.canGoBack) {
            [_loc goBack];
        }
    } else if (sender.tag ==1) {
        if (_loc.canGoForward) {
            [_loc goForward];
        }
    } else if (sender.tag == 2) {
        [_loc reload];
    } else if (sender.tag == 3) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.str]];
        [_loc loadRequest:request];
    }
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
