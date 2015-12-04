//
//  UILabel+XCF.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/2.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (XCF)
/**
 *  1.初始化UILael
 */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color;            // 颜色

/**
 *  2.初始化UILael
 */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
                  alignment:(NSTextAlignment)alignment;  // 对齐方式

/**
 *  3.初始化UILael
 */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
                  alignment:(NSTextAlignment)alignment   // 对齐方式
                      lines:(NSInteger)lines;            // 行数

/**
 *  4.初始化UILael
 */
+ (UILabel *)labelWithFrame:(CGRect)frame                // 结构
                       text:(NSString *)text             // 标题
                       size:(CGFloat)size                // 尺寸
                      color:(UIColor *)color             // 颜色
                  alignment:(NSTextAlignment)alignment   // 对齐方式
                      lines:(NSInteger)lines             // 行数
                shadowColor:(UIColor *)colorShadow;      // 阴影颜色
@end

