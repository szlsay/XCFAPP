//
//  FootHot.h
//  xiachufang
//
//  Created by rkxt_ios on 15/12/08
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FootHotResult,FootHotResultlist,FootHotTracklist;

@interface FootHot : NSObject

@property (nonatomic, copy) NSString *state;

@property (nonatomic, strong) FootHotResult *result;

@property (nonatomic, copy) NSString *message;

@end