//
//  LoginMainController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/4.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "LoginMainController.h"

@interface LoginMainController ()<UITextFieldDelegate>
@property (nonatomic, strong, nullable)XCFTextField *textFieldAccount; //
@property (nonatomic, strong, nullable)XCFTextField *textFieldKey; //
@property (nonatomic, strong, nullable)UIButton *buttonLogin; //

@property (nonatomic, strong, nullable)CALayer *buttonLayer; //

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


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return YES;
}

#pragma mark - event response 事件相应

- (void)backLoginVC
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    if (textField.text.length > 5) {
        return NO;
    }else {
        return YES;
    }
}



- (void)textFieldDidChange:(UITextField *)textField
{
   
    CGRect loginFrame = self.buttonLogin.bounds;
    
    CGFloat length = self.buttonLogin.frame.size.width;
    
    CGFloat smallWidth = length / 11;
    
    loginFrame.origin.x += smallWidth * textField.text.length;
    
    loginFrame.size.width -= smallWidth * textField.text.length;
    
    self.buttonLayer.frame = loginFrame;
    
    
    if (textField.text.length == 11) {
        [textField resignFirstResponder];
        [self.buttonLogin setEnabled:YES];
    }else {
        [self.buttonLogin setEnabled:NO];
    }
}


- (void)login
{
    NSLog(@"%s, %@", __FUNCTION__, self);
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
    
    self.buttonLayer.frame = self.buttonLogin.bounds;
    [self.buttonLogin.layer addSublayer:self.buttonLayer];
    
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
        [_textFieldAccount setClearButtonMode:UITextFieldViewModeAlways];
        [_textFieldAccount setDelegate:self];
        
        // FIXME : 2015-12-21 RAC - target action
        
//        [_textFieldAccount addTarget:self
//                              action:@selector(textFieldDidChange:)
//                    forControlEvents:UIControlEventEditingChanged];
        
        [[_textFieldAccount rac_textSignal] subscribeNext:^(NSString *text) {
            CGRect loginFrame = self.buttonLogin.bounds;
            
            CGFloat length = self.buttonLogin.frame.size.width;
            
            CGFloat smallWidth = length / 11;
            
            loginFrame.origin.x += smallWidth * text.length;
            
            loginFrame.size.width -= smallWidth * text.length;
            
            self.buttonLayer.frame = loginFrame;
            
            
            if (text.length == 11) {
                [_textFieldAccount resignFirstResponder];
                [self.buttonLogin setEnabled:YES];
            }else {
                [self.buttonLogin setEnabled:NO];
            }

        }];
        
        
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
                                 backgroundColor:[XCFColor colorRedText]
                                           title:@"登录"
                                      titleColor:[UIColor whiteColor]
                                        fontSize:15];
        [_buttonLogin.layer setCornerRadius:4];
        [_buttonLogin setEnabled:NO];
        
        // FIXME : 2015-12-21 RAC - target action
//        [_buttonLogin addTarget:self
//                         action:@selector(login)
//               forControlEvents:UIControlEventTouchUpInside];
        
        [[_buttonLogin rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
            LxPrintAnything(登录);
        }];
    }
    return _buttonLogin;
}


- (CALayer *)buttonLayer
{
    if (!_buttonLayer) {
        _buttonLayer = [CALayer layer];
        _buttonLayer.backgroundColor = RGBA(249, 175, 160, 0.3).CGColor;
        _buttonLayer.cornerRadius = 4;
    }
    return _buttonLayer;
}
@end
