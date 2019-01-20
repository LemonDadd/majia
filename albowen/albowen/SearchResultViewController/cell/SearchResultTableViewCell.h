//
//  SearchResultTableViewCell.h
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/10.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SearchResultTableViewCell : UITableViewCell

@property (nonatomic, strong)UIImageView *leftImageView;
@property (nonatomic, strong)UILabel *nameLabel;
@property (nonatomic, strong)UILabel *detailLabel;
@property (nonatomic, strong)UILabel *countLabel;
@property (nonatomic, strong)UIImageView *countImageV;

@end

NS_ASSUME_NONNULL_END
