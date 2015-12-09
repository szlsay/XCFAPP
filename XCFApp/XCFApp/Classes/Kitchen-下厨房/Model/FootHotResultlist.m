//
//  FootHotResultlist.m
//  xiachufang
//
//  Created by rkxt_ios on 15/12/08
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "FootHotResultlist.h"
#import "FootHotTracklist.h"

@implementation FootHotResultlist

+ (NSDictionary *)objectClassInArray{
    return @{@"trackList" : [FootHotTracklist class]};
}

@end
