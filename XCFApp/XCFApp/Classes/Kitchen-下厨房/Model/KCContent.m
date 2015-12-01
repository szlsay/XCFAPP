//
//  KCContent.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/01
//  Copyright (c) ST. All rights reserved.
//

#import "KCContent.h"
#import "KCIssues.h"

@implementation KCContent

+ (NSDictionary *)objectClassInArray{
    return @{@"issues" : [KCIssues class]};
}

@end
