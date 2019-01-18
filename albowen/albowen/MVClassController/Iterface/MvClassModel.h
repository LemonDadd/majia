//
//  MvClassModel.h
//  EggBornProject
//
//  Created by quanqiuwa on 2019/1/11.
//  Copyright © 2019 博源启诚. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MvClassModel : NSObject

@property (nonatomic, assign)NSInteger countNum;
@property (nonatomic, strong)NSArray *MV;

@end


@interface MvListModel : NSObject

@property (nonatomic, copy)NSString *Id;
@property (nonatomic, copy)NSString *title;
@property (nonatomic, copy)NSString *audiofile;
@property (nonatomic, copy)NSString *img;
@property (nonatomic, copy)NSString *user;
@property (nonatomic, copy)NSString *userid;
@property (nonatomic, copy)NSString *headimg;
@property (nonatomic, copy)NSString *address;
@property (nonatomic, copy)NSString *timelength;
@property (nonatomic, copy)NSString *lyricauthor;
@property (nonatomic, copy)NSString *tuneauthor;


@end


NS_ASSUME_NONNULL_END
