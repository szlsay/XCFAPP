//
//  KCIssues.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/01
//  Copyright (c) ST. All rights reserved.
//

#import "KCIssues.h"
#import "KCItems.h"

@implementation KCIssues

+ (NSDictionary *)objectClassInArray{
    return @{@"items" : [KCItems class]};
}

MJLogAllIvars
@end
