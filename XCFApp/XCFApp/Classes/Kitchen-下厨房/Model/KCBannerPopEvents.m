//
//  KCBannerPopEvents.m
//  xiachufang
//
//  Created by rkxt_ios on 15/12/21
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import "KCBannerPopEvents.h"
#import "KCBannerEvents.h"

@implementation KCBannerPopEvents
MJLogAllIvars
+ (NSDictionary *)objectClassInArray{
    return @{@"events" : [KCBannerEvents class]};
}

@end
