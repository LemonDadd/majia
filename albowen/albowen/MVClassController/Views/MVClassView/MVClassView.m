//
//  MVClassView.m
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/9.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "MVClassView.h"
#import "MVCollectionViewCell.h"
#import "MVClassInterface.h"
#import "DistailViewController.h"

@interface  MVClassView()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong)UICollectionView *col;
@property (nonatomic, assign)NSInteger page;
@property (nonatomic, strong)MvClassModel *model;

@end

@implementation MVClassView
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addSubview:self.col];
        [self.col mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}


/**
 *  刷新数据
 */
- (void)addHistoryData{
    
    KWeakSelf;
    self.col.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        weakSelf.page = 1;
        [weakSelf reStartRequestData];
    }];
    // 马上进入刷新状态
    [self.col.mj_header beginRefreshing];
}

- (void)upPull {
    KWeakSelf;
    self.col.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        weakSelf.page++;
        [weakSelf reStartRequestData];
    }];
}

- (void)reStartRequestData {
     KWeakSelf;
    if (self.type == MVClassViewTypeSwift) {
        [MVClassInterface requestGetSiftMvByPageON:self.page request:^(MvClassModel * _Nonnull message, NSString * _Nonnull errorMsg) {
            [weakSelf.col.mj_header endRefreshing];
            [weakSelf.col.mj_footer endRefreshing];
            if (message) {
                weakSelf.model = message;
                [weakSelf.col reloadData];
            }
        }];
    } else {
        [MVClassInterface requestGetRecommendMvByPageON:self.page request:^(MvClassModel * _Nonnull message, NSString * _Nonnull errorMsg) {
            [weakSelf.col.mj_header endRefreshing];
            [weakSelf.col.mj_footer endRefreshing];
            if (message) {
                weakSelf.model = message;
                [weakSelf.col reloadData];
            }
        }];
    }
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _model.MV.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MVCollectionViewCell * cell = (MVCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"MVCollectionViewCell" forIndexPath:indexPath];
    MvListModel *model = [MvListModel mj_objectWithKeyValues:_model.MV[indexPath.row]];
    cell.model = model;
    return cell;
}



#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(KSCREEN_WIDTH/2-.5, 250);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return .5;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    //todo
    //mv点击事件
    DistailViewController *vc = [DistailViewController new];
    [self.viewController.navigationController pushViewController:vc animated:YES];
}


- (UICollectionView *)col {
    if (!_col) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        _col = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _col.backgroundColor = [UIColor clearColor];
        _col.delegate = self;
        _col.dataSource = self;
        [_col registerClass:[MVCollectionViewCell class] forCellWithReuseIdentifier:@"MVCollectionViewCell"];
    }
    return _col;
}

- (void)setType:(MVClassViewType)type {
    _type = type;
    [self addHistoryData];
    [self upPull];
}

@end
