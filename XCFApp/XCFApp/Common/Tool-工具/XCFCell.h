//
//  XCFCell.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/9.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XCFCell : UITableViewCell

/**
 *  1.Cell的复用
 *
 *  @param tableView <#tableView description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype)cellWithTableView:(UITableView*)tableView;

/**
 *  2.设置视图
 */
- (void)setupUI;

@end
