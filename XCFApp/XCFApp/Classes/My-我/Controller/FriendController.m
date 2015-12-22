//
//  FriendController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/22.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "FriendController.h"

@interface FriendController ()

@end

@implementation FriendController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    XCFSearchBar *searchBar = [XCFSearchBar searchBarWithPlaceholder:@"搜索厨友"];
    [self.navigationItem setTitleView:searchBar];

}
#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法

#pragma mark - getters and setters 属性

@end
