//
//  SettingController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/22.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "SettingController.h"

#import "SettingCell.h"

@interface SettingController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong, nullable)UITableView *tableView; //
@property (nonatomic, strong, nullable)NSArray *arrayTitle; //
@end

@implementation SettingController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"设置"];
    
    [self.view addSubview:self.tableView];
}

#pragma mark - Delegate 视图委托
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.arrayTitle.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SettingCell *cell = [SettingCell cellWithTableView:tableView];
    cell.title = self.arrayTitle[indexPath.row];
    return cell;
}


#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法

#pragma mark - getters and setters 属性
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,
                                                                  0,
                                                                  ScreenWidth,
                                                                  ScreenHeight)
                                                 style:UITableViewStylePlain];
        [_tableView setTableFooterView:[UIView new]];
        [_tableView setDelegate:self];
        [_tableView setDataSource:self];
        [_tableView setBackgroundColor:[XCFColor colorControllerBackground]];
    }
    return _tableView;
}

- (NSArray *)arrayTitle
{
    return @[@"账号管理", @"设置密码", @"收货地址",
             @"发现好友", @"消息推送",
             @"把下厨房告诉朋友", @"帮助下厨房评分"];
}
@end
