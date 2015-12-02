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
@property (nonatomic, strong, nonnull)NSArray *arrayTab;
@end

@implementation XCFTabController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    for (NSDictionary<NSString *, NSString *> *dicTab in self.arrayTab) {
        [self addChildVc:dicTab[@"controllerName"]
                   title:dicTab[@"title"]
                   image:dicTab[@"imageName"]
           selectedImage:dicTab[@"imageSelectName"]];
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
    // 1.设置子控制器的默认设置
    UIViewController *childVc = [NSClassFromString(childName) new];
    childVc.title = title; // 同时设置tabbar和navigationBar的文字
    [childVc.view setBackgroundColor:[XCFColor colorControllerBackground]];
    
    // 2.设置子控制器的图片
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // 3.设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [XCFColor colorTabbarNormal];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    
    selectTextAttrs[NSForegroundColorAttributeName] = [XCFColor colorTabbarSelected];
    [childVc.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    
    // 4.先给外面传进来的小控制器 包装 一个导航控制器
    XCFNavController *nav = [[XCFNavController alloc] initWithRootViewController:childVc];
    // 5.添加为子控制器
    [self addChildViewController:nav];
}
#pragma mark - getters and setters 属性

- (NSArray *)arrayTab
{
    if (!_arrayTab) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"XCFTab"
                                                         ofType:@"json"];
        
        NSData *jsonData = [NSData dataWithContentsOfFile:path
                                                  options:NSDataReadingMappedIfSafe
                                                    error:nil];
        
        _arrayTab = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:nil];
        
    }
    return _arrayTab;
}
@end
