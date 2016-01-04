//
//  UIButton+XCF.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/4.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "UIButton+XCF.h"

@implementation UIButton (XCF)

+ (UIButton *)buttonWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize
{
    UIButton *button       = [[UIButton alloc]initWithFrame:frame];
    button.backgroundColor = backgroundColor;
    [button setTitle:title
            forState:UIControlStateNormal];
    [button setTitleColor:titleColor
                 forState:UIControlStateNormal];
    [button.titleLabel setFont:[UIFont systemFontOfSize:fontSize]];
    return button;
}

//- (void)setHighlighted:(BOOL)highlighted
//{
//    
//}

@end
