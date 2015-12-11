//
//  KCIssues.m
//  travelInter
//
//  Created by rkxt_ios on 15/12/10
//  Copyright (c) leowu. All rights reserved.
//

#import "KCIssues.h"
#import "KCItems.h"

@implementation KCIssues

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [KCItems class]};
}
MJLogAllIvars
@end
