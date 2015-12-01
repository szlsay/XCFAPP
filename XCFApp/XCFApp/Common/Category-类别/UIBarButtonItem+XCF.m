//
//  UIBarButtonItem+XCF.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/1.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "UIBarButtonItem+XCF.h"

@implementation UIBarButtonItem (XCF)
/**
 *  1.创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target
                             action:(SEL)action
                              image:(NSString *)image
                          highImage:(NSString *)highImage
{
    // 1.初始化按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target
            action:action
  forControlEvents:UIControlEventTouchUpInside];
    
    // 2.设置图片
    [btn setImage:[UIImage imageNamed:image]
         forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highImage]
         forState:UIControlStateHighlighted];
    
    // 3.设置尺寸
    btn.size = btn.currentImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
