//
//  AppDelegate.m
//  XCFApp
//
//  Created by rkxt_ios on 15/11/30.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "AppDelegate.h"
#import "XCFTabController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [self setupUI];
    
    
    [self setUmeng];
    
    return YES;
}

- (void)setupUI
{
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [XCFTabController new];
    [self.window makeKeyAndVisible];
}


- (void)setUmeng
{
    // 1.appkey填写,BATCH（启动时发送）
    [MobClick startWithAppkey:AppkeyUmeng
                 reportPolicy:BATCH
                    channelId:nil];
    
    // 2.version标识
    [MobClick setAppVersion:APPVERSION];
    
    // 3.账号统计
//    [MobClick profileSignInWithPUID:@"" provider:@""];
    
    
    // 4.设置社会化AppKey
    [UMSocialData setAppKey:AppkeyUmeng];
    
    // 5.
}

/**
 *  3DTouch
 */
- (void)application:(UIApplication *)application
performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem
  completionHandler:(void(^)(BOOL succeeded))completionHandler
{
    [self clickedWithShortcutItem:shortcutItem];
}


-(void)clickedWithShortcutItem:(UIApplicationShortcutItem *)item
{
    if (item.userInfo)
    {
        NSLog(@"%s, %@", __FUNCTION__, item.userInfo[@"url"]);
    }
}


@end
