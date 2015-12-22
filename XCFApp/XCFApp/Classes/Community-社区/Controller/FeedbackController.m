//
//  FeedbackController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/21.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "FeedbackController.h"
#import "HelpController.h"

@interface FeedbackController ()
@property (nonatomic, strong, nullable)UITextView *textView; //
@property (nonatomic, strong, nullable)UITextField *textField; //
@property (nonatomic, strong, nullable)UIButton *buttonHelp; //
@end

@implementation FeedbackController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"反馈"];
    
    self.navigationItem.rightBarButtonItem = [XCFBarButtonItem barButtonItemWithTitle:@"发布"
                                                                               target:self
                                                                               action:@selector(releaseFeedback)];
    
    [self.view addSubview:self.textView];
    [self.view addSubview:self.buttonHelp];
    
    
}
#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应
- (void)releaseFeedback
{
    NSLog(@"%s, %@", __FUNCTION__, self);
}
#pragma mark - private methods 私有方法

#pragma mark - getters and setters 属性

- (UITextView *)textView
{
    if (!_textView) {
        _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 200)];
        [_textView setBackgroundColor:[UIColor whiteColor]];
        [_textView addSubview:self.textField];
        [[_textView rac_textSignal] subscribeNext:^(NSString *text) {
            if (text.length > 0) {
                [self.textField setHidden:YES];
            }else {
                [self.textField setHidden:NO];
            }
        }];

    }
    return _textView;
}

- (UITextField *)textField
{
    if (!_textField) {
        _textField = [[UITextField alloc]initWithFrame:CGRectMake(XCFMarginSmall, 0, ScreenWidth, XCFControlNormalHeight)];
        [_textField setPlaceholder:@"我们有什么可以帮助你吗?"];
        [_textField setFont:[UIFont systemFontOfSize:13]];
        [_textField setEnabled:NO];
    }
    return _textField;
}

- (UIButton *)buttonHelp
{
    if (!_buttonHelp) {
        CGFloat helpY = CGRectGetMaxY(self.textView.frame) + XCFMarginSmall;
        _buttonHelp = [UIButton buttonWithFrame:CGRectMake(0,
                                                           helpY,
                                                           ScreenWidth,
                                                           XCFControlNormalHeight)
                                backgroundColor:[UIColor clearColor]
                                          title:@"查看帮助中心"
                                     titleColor:[XCFColor colorRedText]
                                       fontSize:15];
        [[_buttonHelp rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
            [self.navigationController pushViewController:[HelpController new]
                                                 animated:YES];
        }];
    }
    return _buttonHelp;
}
@end
