//
//  XCFBarButtonItem.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/1.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "XCFBarButtonItem.h"

@implementation XCFBarButtonItem

+ (XCFBarButtonItem *)barButtonItemWithImageName:(NSString *)imageName
                                          target:(id)target
                                          action:(SEL)action
{
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 22)];
    [button setImage:[UIImage imageNamed:imageName]
            forState:UIControlStateNormal];
    [button addTarget:target
               action:action
     forControlEvents:UIControlEventTouchUpInside];
    XCFBarButtonItem *barButtonItem = [[XCFBarButtonItem alloc]initWithCustomView:button];
    return barButtonItem;
}

@end
