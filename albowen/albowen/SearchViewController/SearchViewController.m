//
//  SearchViewController.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "SearchViewController.h"
#import "SearchTitleView.h"
#import "SearchHistroyView.h"
#import "SearchResultView.h"
#import "SearchRequest.h"
@interface SearchViewController ()<SearchTitleViewDelegate>

@property (nonatomic, strong)SearchTitleView *searchTitleView;
@property (nonatomic, strong)SearchHistroyView *historyView;
@property (nonatomic, strong)SearchResultView *resultView;

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.titleView = self.searchTitleView;
    
    _resultView = [SearchResultView new];
    [self.view addSubview:_resultView];
    [_resultView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    _historyView = [SearchHistroyView new];
    [self.view addSubview:_historyView];
    [_historyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    //[self loadData];
}

- (void)pop{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)loadData {
    KWeakSelf;
    //热门标签
    [SearchRequest requestFindMvSearchLabelRequest:^(NSArray * _Nonnull message, NSString * _Nonnull errorMsg) {
        if (message) {
            weakSelf.historyView.hotResource = message;
        }
    }];
    
    //搜索历史列表
    [SearchRequest requestMvUserSearchLogRequest:^(NSArray * _Nonnull message, NSString * _Nonnull errorMsg) {
        if (message) {
        }
    }];
    
    
}

-(void)searchWithStr:(NSString *)searchStr {
    if (searchStr.length) {
        [self.view bringSubviewToFront:_resultView];
        _resultView.title = searchStr;
    } else{
        [self.view bringSubviewToFront:_historyView];
    }
}

-(SearchTitleView *)searchTitleView {
    if (!_searchTitleView) {
        _searchTitleView =[[SearchTitleView alloc]init];
        _searchTitleView.delegate = self;
    }
    return _searchTitleView;
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
