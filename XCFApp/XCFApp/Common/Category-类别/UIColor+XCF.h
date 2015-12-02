//
//  UIColor+XCF.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/2.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  1.返回一个RGBA格式的UIColor对象
 */
#define RGBA(r, g, b, a) [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]

/**
 *  2.返回一个RGB格式的UIColor对象
 */
#define RGB(r, g, b) RGBA(r, g, b, 1.0f)

@interface UIColor (XCF)

/**
 *  1.创建一个随机UIColor对象
 */
+ (UIColor *)randomColor;

@end
