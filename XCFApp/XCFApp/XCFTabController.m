//
//  XCFTabController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/11/30.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "XCFTabController.h"
#import "XCFNavController.h"
@interface XCFTabController ()

/**  1.tabbar名称集 */
@property (nonatomic, strong, nonnull)NSArray *arrayTitle;
/**  2.tabbar图片名称集 */
@property (nonatomic, strong, nonnull)NSArray *arrayImgName;
/**  3.tabbar图片选中名称集 */
@property (nonatomic, strong, nonnull)NSArray *arrayImgSelName;
/**  4.控制器名称集 */
@property (nonatomic, strong, nonnull)NSArray *arrayController;

@end

@implementation XCFTabController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (int i = 0; i < self.arrayController.count; i++) {
        [self addChildVc:self.arrayController[i]
                   title:self.arrayTitle[i]
                   image:self.arrayImgName[i]
           selectedImage:self.arrayImgSelName[i]];
    }
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法

/**
 *  1.添加一个子控制器
 *
 *  @param childName     子控制器名称
 *  @param title         标题
 *  @param image         图片
 *  @param selectedImage 选中的图片
 */
- (void)addChildVc:(NSString *)childName
             title:(NSString *)title
             image:(NSString *)image
     selectedImage:(NSString *)selectedImage
{
    // 1.设置子控制器的文字
    UIViewController *childVc = [NSClassFromString(childName) new];
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    
    // 2.设置子控制器的图片
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 3.设置文字的样式  !!! 颜色需要提出来
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    
    selectTextAttrs[NSForegroundColorAttributeName] = Color(249, 123, 104);
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 4.先给外面传进来的小控制器 包装 一个导航控制器
    XCFNavController *nav = [[XCFNavController alloc] initWithRootViewController:childVc];
    // 5.添加为子控制器
    [self addChildViewController:nav];
}
#pragma mark - getters and setters 属性

// TODO 数据没有封装，可以放到plist或Json文件中
- (NSArray *)arrayTitle
{
    return @[@"下厨房", @"市集", @"社区", @"我"];
}

- (NSArray *)arrayImgName
{
    return @[@"tabADeselected", @"tabBDeselected", @"tabCDeselected",@"tabDDeselected"];
}

- (NSArray *)arrayImgSelName
{
    return @[@"tabASelected", @"tabBSelected", @"tabCSelected", @"tabDSelected"];
}

- (NSArray *)arrayController
{
    return @[@"KitchenController", @"BazController", @"CommController", @"MyController"];
}
@end
