//
//  XCFColor.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/2.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "XCFColor.h"

@implementation XCFColor

+ (UIColor *)colorControllerBackground
{
    return RGB(247, 247, 240);
}

+ (UIColor *)colorNavigationBar
{
    return RGB(255, 255, 255);
}

+ (UIColor *)colorTabbarNormal
{
    return RGB(170, 170, 170);
}

+ (UIColor *)colorTabbarSelected
{
    return RGB(249, 123, 104);
}

+ (UIColor *)colorFlashLine
{
    return RGB(192, 192, 192);
}

+ (UIColor *)colorRedText
{
    return RGB(249, 112, 92);
}

+ (UIColor *)colorTextNormal
{
    return RGB(87, 87, 82);
}

+ (UIColor *)colorLayerPicture
{
    return RGBA(0, 0, 0, (255.0 - 191.0)/255);
}


+ (UIColor *)colorTableSeparatorColor
{
    return RGB(236, 236, 236);
}


@end
