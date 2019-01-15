//
//  SearchRequest.h
//  EggBornProject
//
//  Created by 关云秀 on 2019/1/14.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import "JsonDeal.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchRequest : JsonDeal

+ (void)requestFindMvSearchLabelRequest:(void(^)(NSArray *message,
                                                 NSString *errorMsg))request;

+ (void)requestMvUserSearchLogRequest:(void(^)(NSArray *message,
                                               NSString *errorMsg))request;

+ (void)requestFindMvTitle:(NSString *)title
                   Request:(void(^)(NSArray *message,
                                    NSString *errorMsg))request;

@end

NS_ASSUME_NONNULL_END
