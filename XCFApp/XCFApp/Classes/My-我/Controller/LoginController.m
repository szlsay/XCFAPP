//
//  LoginController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/3.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "LoginController.h"

#import "XCFNavController.h"
#import "LoginMainController.h"

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
    
    [self setupUI];
 }

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应
- (void)closeBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)gotoLoginMainVC
{
    
    XCFNavController *nav = [[XCFNavController alloc]initWithRootViewController:[LoginMainController new]];
    [self presentViewController:nav
                       animated:YES
                     completion:nil];
    
    
}
#pragma mark - private methods 私有方法

- (void)setupUI
{
    // 1.设置背景色
    [self.view setBackgroundColor:[XCFColor colorControllerBackground]];
    
    // 2.添加子视图
    self.imageLogo.centerX = self.view.centerX;
    self.imageLogo.centerY = self.view.centerY - 100;
    [self.view addSubview:self.imageLogo];
    
    [self.view addSubview:self.buttonCancel];
    
    self.buttonLogin.centerX = self.view.centerX;
    self.buttonLogin.centerY = ScreenHeight - 100;
    [self.view addSubview:self.buttonLogin];
    
    self.buttonRegister.centerX = self.view.centerX;
    self.buttonRegister.centerY = ScreenHeight - 40;
    [self.view addSubview:self.buttonRegister];
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
        _buttonCancel = [[UIButton alloc]initWithFrame:CGRectMake(XCFMargin,
                                                                  XCFMargin + XCFStatusBarHeight,
                                                                  XCFControlSystemHeight,
                                                                  XCFControlSystemHeight)];
        [_buttonCancel setImage:[UIImage imageNamed:@"closeBlack"]
                       forState:UIControlStateNormal];
        [_buttonCancel setBordersWithColor:[XCFColor colorRedText]
                              cornerRadius:XCFControlSystemHeight/2
                               borderWidth:1];
        
        [_buttonCancel addTarget:self
                          action:@selector(closeBack)
                forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    return _buttonCancel;
}

- (UIButton *)buttonLogin
{
    if (!_buttonLogin) {
        _buttonLogin = [UIButton buttonWithFrame:CGRectMake(0,
                                                            0,
                                                            ScreenWidth-XCFControlNormalHeight,
                                                            XCFControlSystemHeight)
                                    backgroundColor:RGB(249, 102, 80)
                                              title:@"登录"
                                         titleColor:[UIColor whiteColor]
                                           fontSize:14];
        [_buttonLogin.layer setCornerRadius:4];
        [_buttonLogin addTarget:self
                         action:@selector(gotoLoginMainVC)
               forControlEvents:UIControlEventTouchUpInside];
    }
    return _buttonLogin;
}

- (UIButton *)buttonRegister
{
    if (!_buttonRegister) {
        _buttonRegister = [UIButton buttonWithFrame:CGRectMake(0,
                                                               0,
                                                               ScreenWidth-XCFControlNormalHeight,
                                                               XCFControlSystemHeight)
                                    backgroundColor:RGB(114, 163, 211)
                                              title:@"手机注册"
                                         titleColor:[UIColor whiteColor]
                                           fontSize:14];
        [_buttonRegister.layer setCornerRadius:4];
    }
    return _buttonRegister;
}


@end
