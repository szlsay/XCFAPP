//
//  KitchenController.m
//  XCFApp
//
//  Created by rkxt_ios on 15/11/30.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KitchenController.h"

#import "KC.h"
#import "KCContent.h"
#import "KCIssues.h"
#import "KCItems.h"

#import "XCFSearchBar.h"
//#import "UIBarButtonItem+XCF.h"
@interface KitchenController ()

@end

@implementation KitchenController

#pragma mark - lift cycle 生命周期

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:Color(247, 247, 240)];
    
    XCFSearchBar *searchBar = [XCFSearchBar searchBarWithPlaceholder:@"菜谱、食物"];
    [self.navigationItem setTitleView:searchBar];
    

    UIButton *leftView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 28, 28)];
    
    [leftView setImage:[UIImage imageNamed:@"homepageCreateRecipeButton"] forState:UIControlStateNormal];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:leftView];
    
    UIButton *rightView = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 28, 28)];
     [rightView setImage:[UIImage imageNamed:@"buylistButtonImage"] forState:UIControlStateNormal];
    [rightView setBackgroundColor:[UIColor redColor]];
    

    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithCustomView:rightView];
    [rightBar setImageInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    
    
    self.navigationItem.rightBarButtonItem = rightBar;
    
    NSLog(@"%s, %@", __FUNCTION__, NSStringFromCGRect(rightView.frame));
    
    
    
//    NSString *baseUrl = @"http://api.xiachufang.com/v2/issues/list.json?";
//    NSString *api = @"cursor=2015-11-30&origin=iphone&api_sign=8f3e001c81ac5733f2570b30e925b58e&sk=w6wLf9JUTDysdvaxDKoVJA&size=2&timezone=Asia%2FShanghai&version=5.1.1&api_key=0f9f79be1dac5f003e7de6f876b17c00";
//    
//    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
//    
//    [manager GET:[baseUrl stringByAppendingString:api] parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
//        
//        KC *kc = [KC objectWithKeyValues:responseObject];
//        KCContent *content = kc.content;
//        
//        for (KCIssues *issues in content.issues) {
//            NSLog(@"%s, %lu", __FUNCTION__, (unsigned long)issues.items.count);
//            for (KCItems *items in issues.items) {
//                NSLog(@"%s, %@", __FUNCTION__, items.publish_time);
//            }
//        }
//    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
//        
//    }];
}

#pragma mark - Delegate 视图委托

#pragma mark - event response 事件相应

#pragma mark - private methods 私有方法

#pragma mark - getters and setters 属性

@end
