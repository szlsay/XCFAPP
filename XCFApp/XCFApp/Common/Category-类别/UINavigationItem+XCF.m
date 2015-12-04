//
//  UINavigationItem+XCF.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/1.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "UINavigationItem+XCF.h"

static const CGFloat NavigationItemMargin = 6;

@implementation UINavigationItem (XCF)

// TODO: UINavigationItem方法需要改进

- (void)setLeftBarButtonItem:(UIBarButtonItem *)leftBarButtonItem
{
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -16 + NavigationItemMargin;
    
    if (leftBarButtonItem)
    {
        [self setLeftBarButtonItems:@[negativeSeperator, leftBarButtonItem]];
    }
    else
    {
        [self setLeftBarButtonItems:@[negativeSeperator]];
    }
}

- (void)setRightBarButtonItem:(UIBarButtonItem *)rightBarButtonItem
{
    UIBarButtonItem *negativeSeperator = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSeperator.width = -16 + NavigationItemMargin;
    
    if (rightBarButtonItem)
    {
        [self setRightBarButtonItems:@[negativeSeperator, rightBarButtonItem]];
    }
    else
    {
        [self setRightBarButtonItems:@[negativeSeperator]];
    }
}

- (void)setTitle:(NSString *)title
{
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 0, 44)];
    [label setText:title];
    [label setFont:[UIFont systemFontOfSize:16]];
    [label setTextColor:RGB(56, 56, 49)];
    self.titleView = label;
}

@end
