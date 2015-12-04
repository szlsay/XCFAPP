//
//  KCCreateController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/1.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCCreateController.h"

@interface KCCreateController ()

/** 1.中间的标题 */
@property (nonatomic, strong, nullable)UILabel *labelContent;
/** 2.输入框 */
@property (nonatomic, strong, nullable)UITextField *textField;

@end

@implementation KCCreateController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建UI视图
    [self setupUI];
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法

/**
 *  1.创建UI视图
 */
- (void)setupUI
{
    // 1.设置标题
    [self.navigationItem setTitle:@"创建菜谱"];
    
    // 2.添加子视图
    self.labelContent.center = self.view.center;
    [self.view addSubview:self.labelContent];

}

#pragma mark - getters and setters 属性
- (UILabel *)labelContent
{
    if (!_labelContent) {
        _labelContent = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 21)];
        [_labelContent setText:@"创建菜谱的人是厨房里的天使"];
        [_labelContent setTextColor:RGB(109, 96, 90)];
        [_labelContent setTextAlignment:NSTextAlignmentCenter];
        [_labelContent setFont:[UIFont systemFontOfSize:17]];
    }
    return _labelContent;
}

- (UITextField *)textField
{
    if (!_textField) {
        
    }
    return _textField;
}

@end
