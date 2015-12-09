//
//  FootHotResultlist.h
//  xiachufang
//
//  Created by rkxt_ios on 15/12/08
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FootHotTracklist;

@interface FootHotResultlist : NSObject

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, copy) NSString *trackId;

@property (nonatomic, copy) NSString *resultList;

@property (nonatomic, copy) NSString *pictureUrl;

@property (nonatomic, strong) NSArray<FootHotTracklist *> *trackList;

@property (nonatomic, assign) NSInteger collectAmount;

@property (nonatomic, assign) long long userId;

@property (nonatomic, assign) long long createTime;

@property (nonatomic, assign) NSInteger collectId;

@property (nonatomic, copy) NSString *reason;

@property (nonatomic, assign) NSInteger pageCount;

@property (nonatomic, assign) long long shareId;

@property (nonatomic, assign) NSInteger pageNo;

@property (nonatomic, assign) NSInteger pageSize;

@end