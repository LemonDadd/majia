//
//  UserViewController.m
//  albowen
//
//  Created by 关云秀 on 2019/1/13.
//  Copyright © 2019 xuannalisha. All rights reserved.
//

#import "UserViewController.h"
#import "MineView.h"

@interface UserViewController ()
@property (nonatomic, strong)MineView *mineView;
@end

@implementation UserViewController

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    if (_mineView) {
        [_mineView.mainTableView reloadData];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    _mineView = [MineView new];
    [self.view addSubview:_mineView];
    [_mineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
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
