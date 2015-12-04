//
//  XCFSearchBar.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/1.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "XCFSearchBar.h"

@implementation XCFSearchBar

+ (XCFSearchBar *)searchBarWithPlaceholder:(NSString *)placeholder
{
    // 1.初始化
    XCFSearchBar *searchBar = [[XCFSearchBar alloc]init];
    
    // 2.设置图片
    [searchBar setImage:[UIImage imageNamed:@"searchIcon"]
       forSearchBarIcon:UISearchBarIconSearch
                  state:UIControlStateNormal];
    
    // 3.设置占位符字和闪烁条的颜色
    [searchBar setTintColor:[XCFColor colorFlashLine]];
    searchBar.placeholder = placeholder;
    
    // 4.设置背景色
    UIView *searchBarSub = searchBar.subviews[0];
    for (UIView *subView in searchBarSub.subviews) {
        
        if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            [subView setBackgroundColor:Color(247, 247, 240)];
        }
        
        if ([subView isKindOfClass:NSClassFromString(@"UISearchBarBackground")]) {
            [subView removeFromSuperview];
        }
    }
    
    return searchBar;
}

@end
