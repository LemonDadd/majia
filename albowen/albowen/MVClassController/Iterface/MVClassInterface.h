//
//  MVClassInterface.h
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/11.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "JsonDeal.h"
#import "MvClassModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MVClassInterface : JsonDeal

/**
 MVlist
 */
+ (void)requestGetSiftMvByPageON:(NSInteger)page
                         request:(void(^)(MvClassModel *message,
                                          NSString *errorMsg))request;

/**
 推荐MVlist
 */
+ (void)requestGetRecommendMvByPageON:(NSInteger)page
                              request:(void(^)(MvClassModel *message,
                                               NSString *errorMsg))request;

@end

NS_ASSUME_NONNULL_END
