//
//  XCFNoDataView.m
//  XCFApp
//
//  Created by rkxt_ios on 16/1/4.
//  Copyright © 2016年 ST. All rights reserved.
//

#import "XCFNoDataView.h"

@interface XCFNoDataView()
@property (nonatomic, strong, nullable)UIButton *buttonRefresh; //
@property (nonatomic, strong, nullable)UILabel *labelTitle0; //
@property (nonatomic, strong, nullable)UILabel *labelTitle1; //

@end



@implementation XCFNoDataView

- (instancetype)init
{
    if (self = [super init]) {
        self.frame = CGRectMake(0, 0, ScreenWidth, ScreenHeight);
        
        [self addSubview:self.buttonRefresh];
        [self addSubview:self.labelTitle0];
        [self addSubview:self.labelTitle1];
        
    }
    return self;
}

- (void)showWithSuperView:(UIView *_Nullable)superView
               returnDate:(RetureNodataBlock _Nullable)block
{
    [superView addSubview:[XCFNoDataView sharedInstance]];
    self.block = block;
}

+ (void)remove
{
    [[XCFNoDataView sharedInstance] removeFromSuperview];
}

- (UIButton *)buttonRefresh
{
    if (!_buttonRefresh) {
        _buttonRefresh = [UIButton buttonWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)
                                   backgroundColor:[XCFColor colorControllerBackground]
                                             title:@""
                                        titleColor:[XCFColor colorTextNormal]
                                          fontSize:19];
        [_buttonRefresh setTitle:@"" forState:UIControlStateHighlighted];
        
        [[_buttonRefresh rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            LxDBAnyVar(_buttonRefresh);
            if (self.block) {
                self.block([XCFNoDataView sharedInstance]);
            }
            
        }];
    }
    return _buttonRefresh;
}

- (UILabel *)labelTitle0
{
    if (!_labelTitle0) {
        _labelTitle0 = [UILabel labelWithFrame:CGRectMake(0,
                                                          0,
                                                          ScreenWidth,
                                                          XCFControlNormalHeight)
                                          text:@"不对,你好像处在离线状态"
                                          size:19
                                         color:[XCFColor colorTextNormal]
                                     alignment:NSTextAlignmentCenter];
        _labelTitle0.centerY = self.centerY;
    }
    return _labelTitle0;
}

- (UILabel *)labelTitle1
{
    if (!_labelTitle1) {
        _labelTitle1 = [UILabel labelWithFrame:CGRectMake(0,
                                                          self.labelTitle0.bottom,
                                                          ScreenWidth,
                                                          XCFControlNormalHeight)
                                          text:@"轻触屏幕重新加载"
                                          size:15
                                         color:[XCFColor colorTextNormal]
                                     alignment:NSTextAlignmentCenter];
    }
    return _labelTitle1;
}



@end
