//
//  UIColor+XCF.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/2.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "UIColor+XCF.h"

@implementation UIColor (XCF)

/* 1.创建一个随机UIColor对象 */
+ (UIColor *)randomColor
{
    int r = arc4random() % 255;
    int g = arc4random() % 255;
    int b = arc4random() % 255;
    
    return [UIColor colorWithRed:r/255.0
                           green:g/255.0
                            blue:b/255.0
                           alpha:1.0];
}

@end
