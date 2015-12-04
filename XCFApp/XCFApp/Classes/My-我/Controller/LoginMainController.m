//
//  LoginMainController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/4.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "LoginMainController.h"

@interface LoginMainController ()
@property (nonatomic, strong, nullable)XCFTextField *textFieldAccount; //
@property (nonatomic, strong, nullable)XCFTextField *textFieldKey; //
@property (nonatomic, strong, nullable)UIButton *buttonLogin; //

@end

@implementation LoginMainController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建视图UI
    [self setupUI];
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

- (void)backLoginVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - private methods 私有方法

/**
 *  1.创建视图UI
 */
- (void)setupUI
{
    // 1.设置标题和颜色
    [self.view setBackgroundColor:[XCFColor colorControllerBackground]];
    [self.navigationItem setTitle:@"登录"];
    
    // 2.设置左边的Item
    [self.navigationItem setLeftBarButtonItem:[XCFBarButtonItem barButtonItemWithTitle:@"取消"
                                                                                target:self
                                                                                action:@selector(backLoginVC)]];
    
    // 3.添加子视图
    [self.view addSubview:self.textFieldAccount];
    [self.view addSubview:self.textFieldKey];
    [self.view addSubview:self.buttonLogin];
}

#pragma mark - getters and setters 属性

- (XCFTextField *)textFieldAccount
{
    if (!_textFieldAccount) {
        _textFieldAccount = [XCFTextField textFieldWithFrame:CGRectMake(0,
                                                                        XCFMargin + XCFNavigationBarY,ScreenWidth,
                                                                        XCFControlSystemHeight)
                                                 placeholder:@"手机号"];
        [_textFieldAccount setKeyboardType:UIKeyboardTypeNumberPad];
        
    }
    return _textFieldAccount;
}

- (UITextField *)textFieldKey
{
    if (!_textFieldKey) {
        CGFloat keyY = CGRectGetMaxY(self.textFieldAccount.frame) + 1;
        _textFieldKey = [XCFTextField textFieldWithFrame:CGRectMake(0,
                                                                    keyY,
                                                                    ScreenWidth,
                                                                    XCFControlSystemHeight)
                                             placeholder:@"登录密码"];
        [_textFieldKey setSecureTextEntry:YES];
    }
    return _textFieldKey;
}

- (UIButton *)buttonLogin
{
    if (!_buttonLogin) {
        CGFloat loginY = CGRectGetMaxY(self.textFieldKey.frame) + 2 * XCFMargin;
        _buttonLogin = [UIButton buttonWithFrame:CGRectMake(XCFMargin,
                                                            loginY,
                                                            ScreenWidth - 2*XCFMargin,
                                                            XCFControlSystemHeight)
                                 backgroundColor:RGB(249, 175, 160)
                                           title:@"登录"
                                      titleColor:[UIColor whiteColor]
                                        fontSize:15];
        [_buttonLogin.layer setCornerRadius:4];
    }
    return _buttonLogin;
}

@end
