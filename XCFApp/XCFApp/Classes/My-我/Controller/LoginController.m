//
//  LoginController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/3.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "LoginController.h"

@interface LoginController ()
@property (nonatomic, strong, nullable)UIImageView *imageLogo; //
@property (nonatomic, strong, nullable)UIButton    *buttonCancel; //

@property (nonatomic, strong, nullable)UIButton *buttonLogin; //
@property (nonatomic, strong, nullable)UIButton *buttonRegister; //
@end

@implementation LoginController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[XCFColor colorControllerBackground]];
    
    self.imageLogo.centerX = self.view.centerX;
    self.imageLogo.centerY = self.view.centerY - 100;
    [self.view addSubview:self.imageLogo];
    
    [self.view addSubview:self.buttonCancel];
    
    self.buttonLogin.center = self.view.center;
    [self.view addSubview:self.buttonLogin];
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法

- (void)closeBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - getters and setters 属性

- (UIImageView *)imageLogo
{
    if (!_imageLogo) {
        _imageLogo = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"logo"]];
    }
    return _imageLogo;
}

- (UIButton *)buttonCancel
{
    if (!_buttonCancel) {
        _buttonCancel = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 44, 44)];
        [_buttonCancel setImage:[UIImage imageNamed:@"closeBlack"] forState:UIControlStateNormal];
        [_buttonCancel addTarget:self
                          action:@selector(closeBack)
                forControlEvents:UIControlEventTouchUpInside];
        [_buttonCancel.layer setCornerRadius:22];
        [_buttonCancel.layer setBorderColor:[XCFColor colorRedText].CGColor];
        [_buttonCancel.layer setBorderWidth:1];
        [_buttonCancel.layer setMasksToBounds:YES];
    }
    return _buttonCancel;
}

- (UIButton *)buttonLogin
{
    if (!_buttonLogin) {
        _buttonLogin = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth - 40, 34)];
        [_buttonLogin setBackgroundColor:[UIColor redColor]];
        [_buttonLogin setTitle:@"登录" forState:UIControlStateNormal];
        [_buttonLogin setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    }
    return _buttonLogin;
}

@end
