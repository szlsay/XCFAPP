//
//  BazController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/11/30.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "BazController.h"
#import "XCFSearchBar.h"
@interface BazController ()

@end

@implementation BazController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XCFSearchBar *searchBar = [XCFSearchBar searchBarWithPlaceholder:@"搜索商品"];
    
    // 2.添加导航按钮
    self.navigationItem.leftBarButtonItem = [XCFBarButtonItem barButtonItemWithImageName:@"leftPageButtonBackgroundNormal"
                                                                                  target:self
                                                                                  action:@selector(gotoVC)];
    
    self.navigationItem.rightBarButtonItem = [XCFBarButtonItem barButtonItemWithImageName:@"shoppingCart"
                                                                                   target:self
                                                                                   action:@selector(gotoVC)];
    
    [self.navigationItem setTitleView:searchBar];
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

- (void)gotoVC
{
    NSLog(@"%s, %@", __FUNCTION__, self);
}

#pragma mark - private methods 私有方法

#pragma mark - getters and setters 属性

@end
