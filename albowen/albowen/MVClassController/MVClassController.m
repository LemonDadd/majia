//
//  MVClassController.m
//  EggBornProject
//
//  Created by 博源启诚 on 2018/12/13.
//  Copyright © 2018年 博源启诚. All rights reserved.
//

#import "MVClassController.h"
#import "MVTieleView.h"
#import "MVClassView.h"

@interface MVClassController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *scr;
@property (nonatomic, strong)UIView *contentView;
@property (nonatomic, strong)MVTieleView *titleView;


@end

@implementation MVClassController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    KWeakSelf;
    
    self.navigationItem.titleView =self.titleView;
    self.titleView.seletedItem = ^(NSInteger indx) {
        [weakSelf seletedItem:indx];
    };
    
    _scr = [UIScrollView new];
    _scr.delegate =self;
    _scr.pagingEnabled = YES;
    [self.view addSubview:_scr];
    [_scr mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
        make.height.equalTo(self.view);
    }];
    
    _contentView = [UIView new];
    [_scr addSubview:_contentView];
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.scr);
        make.height.equalTo(self.scr);
    }];
    
    
    UIView *last = nil;
    for (int i=0; i<2; i++) {
        MVClassView *mvView = [MVClassView new];
        mvView.type = i;
        [_contentView addSubview:mvView];
        [mvView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.equalTo(self.contentView);
            make.width.equalTo(self.view);
            if (last == nil) {
                make.left.equalTo(self.contentView);
            } else {
                make.left.equalTo(last.mas_right);
            }
        }];
        last = mvView;
    }
    [_contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(last);
    }];
    
    if (@available(iOS 11.0, *)) {
        _scr.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }else {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
}

#pragma mark - scrollViewDelegate

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    NSInteger indx = scrollView.contentOffset.x/KSCREEN_WIDTH;
    self.titleView.indx = indx;
}

- (void)seletedItem:(NSInteger)indx {
    [_scr setContentOffset:CGPointMake(KSCREEN_WIDTH*indx, 0) animated:YES];
}

- (UIView *)titleView {
    if (!_titleView) {
        _titleView = [[MVTieleView alloc]initWithFrame:CGRectMake(0, 0, 100, 64)];
    }
    return _titleView;
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
