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
    XCFSearchBar *searchBar = [[XCFSearchBar alloc]initWithFrame:CGRectMake(0,
                                                                            0,
                                                                            0,
                                                                            44)];
    
    [searchBar setImage:[UIImage imageNamed:@"searchIcon"]
       forSearchBarIcon:UISearchBarIconSearch
                  state:UIControlStateNormal];
    
    [searchBar setTintColor:Color(192, 192, 192)];
    searchBar.placeholder = placeholder;
    
    UIView *searchBarSub = searchBar.subviews[0];
    for (UIView *subView in searchBarSub.subviews) {
        if ([subView isKindOfClass:NSClassFromString(@"UISearchBarTextField")]) {
            [subView setBackgroundColor:Color(123, 54, 65)];
        }
    }
    
    return searchBar;
}

@end
