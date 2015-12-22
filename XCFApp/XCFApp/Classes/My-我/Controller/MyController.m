//
//  MyController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/11/30.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "MyController.h"
#import "FriendController.h"
#import "SettingController.h"

@interface MyController ()

@end

@implementation MyController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"我"];
    
    self.navigationItem.leftBarButtonItem = [XCFBarButtonItem barButtonItemWithImageName:@"navFindFriendsImage"
                                                                                  target:self
                                                                                  action:@selector(gotoFriendVC)];
    self.navigationItem.rightBarButtonItem = [XCFBarButtonItem barButtonItemWithImageName:@"rightPageSetting"
                                                                                   target:self
                                                                                   action:@selector(gotoSettingVC)];
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法
- (void)gotoFriendVC
{
    [self.navigationController pushViewController:[FriendController new]
                                         animated:YES];
}

- (void)gotoSettingVC
{
    [self.navigationController pushViewController:[SettingController new]
                                         animated:YES];
}
#pragma mark - getters and setters 属性

@end
