//
//  CommController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/11/30.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "CommController.h"
#import "FeedbackController.h"
@interface CommController ()
@property (nonatomic, strong, nullable)UIButton *buttonFeedback; //
@end

@implementation CommController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"社区"];
    
    self.navigationItem.rightBarButtonItem = [XCFBarButtonItem barButtonItemWithImageName:@"notification"
                                                                                   target:self
                                                                                   action:@selector(gotoVC)];
    [self.view addSubview:self.buttonFeedback];
    
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法
- (void)gotoVC
{
    NSLog(@"%s, %@", __FUNCTION__, self);
}

#pragma mark - getters and setters 属性
- (UIButton *)buttonFeedback
{
    if (!_buttonFeedback) {
        _buttonFeedback = [UIButton buttonWithFrame:CGRectMake(0,
                                                               ScreenHeight - XCFControlSystemHeight*3,
                                                               ScreenWidth,
                                                               XCFControlSystemHeight)
                                    backgroundColor:[UIColor clearColor]
                                              title:@"意见反馈"
                                         titleColor:[XCFColor colorTextNormal]
                                           fontSize:15];
        
        [[_buttonFeedback rac_signalForControlEvents:UIControlEventTouchUpInside]
         subscribeNext:^(id x) {
             [self.navigationController pushViewController:[FeedbackController new] animated:YES];
        }];
    }
    return _buttonFeedback;
}
@end
