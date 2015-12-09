//
//  FootHotTracklist.h
//  xiachufang
//
//  Created by rkxt_ios on 15/12/08
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface FootHotTracklist : NSObject

@property (nonatomic, copy) NSString *description;

@property (nonatomic, assign) NSInteger currentPage;

@property (nonatomic, assign) NSInteger totalCount;

@property (nonatomic, assign) long long trackId;

@property (nonatomic, copy) NSString *recordingUrl;

@property (nonatomic, copy) NSString *resultList;

@property (nonatomic, copy) NSString *pictureUrl;

@property (nonatomic, assign) long long pictureId;

@property (nonatomic, assign) long long userId;

@property (nonatomic, assign) long long createTime;

@property (nonatomic, assign) NSInteger pageCount;

@property (nonatomic, assign) NSInteger pageNo;

@property (nonatomic, assign) NSInteger recording;

@property (nonatomic, assign) NSInteger pageSize;

@end