//
//  ConfigConst.h
//  XCFApp
//
//  Created by rkxt_ios on 16/1/4.
//  Copyright © 2016年 ST. All rights reserved.
//

@import UIKit;
@import ObjectiveC;
@import Foundation;

// 1.弱引用
#define XCFWeakSelf __weak typeof(self) weakSelf = self;

// 2.屏幕尺寸
#define ScreenWidth  CGRectGetWidth([UIScreen mainScreen].bounds)
#define ScreenHeight CGRectGetHeight([UIScreen mainScreen].bounds)

// 3.版本号
#define APPVERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

// 4.请求返回的数据
typedef void(^CompletionBlock)(id returnValue);
typedef void(^FailureBlock)(NSError *error);

// 5.没数据时的界面
#define ShowNoDataView(FunctionName) [[XCFNoDataView alloc]showWithSuperView:self.view \
returnDate:^(XCFNoDataView * _Nullable nodataView) { FunctionName; }];

#define RemoveNoDataView [XCFNoDataView remove];



