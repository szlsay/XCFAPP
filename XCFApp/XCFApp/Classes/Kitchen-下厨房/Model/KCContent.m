//
//  KCContent.m
//  travelInter
//
//  Created by rkxt_ios on 15/12/10
//  Copyright (c) leowu. All rights reserved.
//

#import "KCContent.h"
#import "KCIssues.h"

@implementation KCContent

+ (NSDictionary *)objectClassInArray{
    return @{@"issues" : [KCIssues class]};
}

MJLogAllIvars
@end
