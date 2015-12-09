//
//  FootHotResult.h
//  xiachufang
//
//  Created by rkxt_ios on 15/12/08
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FootHotResultlist,FootHotTracklist;

@interface FootHotResult : NSObject

@property (nonatomic, assign) NSInteger pageCount;

@property (nonatomic, strong) NSArray<FootHotResultlist *> *resultList;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) NSInteger pageSize;

@property (nonatomic, assign) NSInteger pageNo;

@end