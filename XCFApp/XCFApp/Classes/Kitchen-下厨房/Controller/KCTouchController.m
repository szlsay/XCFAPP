//
//  KCTouchController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/11.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCTouchController.h"
#import "KCItems.h"
@interface KCTouchController ()
@property (nonatomic, strong, nullable)UIWebView *webView; //
@end

@implementation KCTouchController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.items.url]]];
    [self.view addSubview:self.webView];
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法
#pragma mark - Preview Actions

- (NSArray<id<UIPreviewActionItem>> *)previewActionItems
{
    
    // 生成UIPreviewAction
    UIPreviewAction *action1 = [UIPreviewAction actionWithTitle:@"事件 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 1 selected");
        [self.delegate touchControllerItems:self.items];
    }];
    
    UIPreviewAction *action2 = [UIPreviewAction actionWithTitle:@"事件 2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 2 selected");
    }];
    
    UIPreviewAction *action3 = [UIPreviewAction actionWithTitle:@"事件 3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"Action 3 selected");
    }];
    
    UIPreviewAction *tap1 = [UIPreviewAction actionWithTitle:@"按钮 1" style:UIPreviewActionStyleDefault handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 1 selected");
    }];
    
    UIPreviewAction *tap2 = [UIPreviewAction actionWithTitle:@"按钮 2" style:UIPreviewActionStyleDestructive handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 2 selected");
    }];
    
    UIPreviewAction *tap3 = [UIPreviewAction actionWithTitle:@"按钮 3" style:UIPreviewActionStyleSelected handler:^(UIPreviewAction * _Nonnull action, UIViewController * _Nonnull previewViewController) {
        NSLog(@"tap 3 selected");
    }];
    
    NSArray *actions = @[action1, action2, action3];
    NSArray *taps = @[tap1, tap2, tap3];
    UIPreviewActionGroup *group1 = [UIPreviewActionGroup actionGroupWithTitle:@"一组事件" style:UIPreviewActionStyleDefault actions:actions];
    UIPreviewActionGroup *group2 = [UIPreviewActionGroup actionGroupWithTitle:@"一组按钮" style:UIPreviewActionStyleDefault actions:taps];
    NSArray *group = @[group1,group2];
    
    //当然你也可以反三个单独的action对象的数组，而不是group，具体效果，可以自己试一下
    
    return group;
}


#pragma mark - getters and setters 属性

- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    }
    return _webView;
}

@end
