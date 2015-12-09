//
//  KCController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/11/30.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCController.h"

#import "XCFSearchBar.h"
#import "XCFBarButtonItem.h"

#import "KCCreateController.h"

#import "KC+request.h"

#import "KCIssues.h"

@interface KCController ()

@property (nonatomic, strong) NSArray<KCIssues *> *issues;
@end

@implementation KCController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupUI];
    
    [self setupData];
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应
- (void)gotoVC
{
    [self.navigationController pushViewController:[KCCreateController new] animated:YES];
}
#pragma mark - private methods 私有方法

- (void)setupUI
{
    // 1.添加搜索框
    XCFSearchBar *searchBar = [XCFSearchBar searchBarWithPlaceholder:@"菜谱、食物"];
    [self.navigationItem setTitleView:searchBar];
    
    // 2.添加导航按钮
    self.navigationItem.leftBarButtonItem = [XCFBarButtonItem barButtonItemWithImageName:@"homepageCreateRecipeButton"
                                                                                     target:self
                                                                                  action:@selector(gotoVC)];
    
    self.navigationItem.rightBarButtonItem = [XCFBarButtonItem barButtonItemWithImageName:@"buylistButtonImage"
                                                                                   target:self
                                                                                   action:@selector(gotoVC)];
    
}


- (void)setupData
{
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
    
    [KC requestWithCompletionBlock:^(id returnValue) {
        self.issues = returnValue;
        NSLog(@"%s, %@", __FUNCTION__, self.issues);
        
        dispatch_group_leave(group);
    } failureBlock:^(NSError *error) {
        dispatch_group_leave(group);
        
    }];
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
    });
}
#pragma mark - getters and setters 属性

@end
