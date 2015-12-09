//
//  FootHotResult.m
//  xiachufang
//
//  Created by rkxt_ios on 15/12/08
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "FootHotResult.h"
#import "FootHotResultlist.h"

@implementation FootHotResult

+ (NSDictionary *)objectClassInArray{
    return @{@"resultList" : [FootHotResultlist class]};
}

@end
