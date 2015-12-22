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

/**
 *  5.搜索框和输入框的闪烁线的颜色
 *
 *  @return <#return value description#>
 */
+ (UIColor *)colorFlashLine;

/**
 *  6.默认红色的字体色
 *
 *  @return <#return value description#>
 */
+ (UIColor *)colorRedText;

/**
 *  7.字体的默认颜色
 */
+ (UIColor *)colorTextNormal;

/**
 *  8.图片的layer颜色
 *
 *  @return <#return value description#>
 */
+ (UIColor *)colorLayerPicture;

/**
 *  9.系统UITableView的边线颜色
 */
+ (UIColor *)colorTableSeparatorColor;
@end
