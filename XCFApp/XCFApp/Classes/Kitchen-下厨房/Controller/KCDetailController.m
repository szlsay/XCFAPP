//
//  KCDetailController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/11.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCDetailController.h"
#import "KCItems.h"
@interface KCDetailController ()
@property (nonatomic, strong, nullable)UIWebView *webView; //
@end

@implementation KCDetailController

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

#pragma mark - getters and setters 属性
- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc]initWithFrame:self.view.bounds];
    }
    return _webView;
}

@end
