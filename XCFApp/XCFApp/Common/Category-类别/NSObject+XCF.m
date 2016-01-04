//
//  NSObject+XCF.m
//  XCFApp
//
//  Created by rkxt_ios on 16/1/4.
//  Copyright © 2016年 ST. All rights reserved.
//

#import "NSObject+XCF.h"

@implementation NSObject (XCF)

static id instance_;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance_ = [[self alloc] init];
    });
    return instance_;
}
@end
