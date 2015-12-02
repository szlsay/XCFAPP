//
//  XCFColor.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/2.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFColor : UIColor

/**
 *  1.控制器的背景色
 */
+ (UIColor *)colorControllerBackground;

/**
 *  2.导航的背景色
 */
+ (UIColor *)colorNavigationBar;

/**
 *  3.TabBar字体的普通色
 */
+ (UIColor *)colorTabbarNormal;

/**
 *  4.TabBar字体的选中色
 */
+ (UIColor *)colorTabbarSelected;
@end
