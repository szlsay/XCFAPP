//
//  XCFNavController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/11/30.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "XCFNavController.h"
#import "UIBarButtonItem+XCF.h"
@interface XCFNavController ()

@end

@implementation XCFNavController



#pragma mark - lift cycle 生命周期

- (void)loadView
{
    [super loadView];
    
    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
}
#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

- (void)backVC
{
    [self popViewControllerAnimated:YES];
}

#pragma mark - private methods 私有方法

- (void)pushViewController:(UIViewController *)viewController
                  animated:(BOOL)animated
{
    // 1.设置TabBar的隐藏和控制器的背景色
    self.edgesForExtendedLayout  = UIRectEdgeNone;
    [viewController.view setBackgroundColor:Color(247, 247, 240)];
    
    // 2.设置视图
    if (self.viewControllers.count > 0) {
        
        // 1.自动显示和隐藏tabbar
        viewController.hidesBottomBarWhenPushed = YES;
        
        // 2.设置左边的Item
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithTarget:self
                                                                                   action:@selector(backVC)
                                                                                    image:@"backStretchBackgroundNormal"
                                                                                highImage:@"backStretchBackgroundNormal"];
    }
    
    [super pushViewController:viewController animated:animated];

}



#pragma mark - getters and setters 属性

@end
