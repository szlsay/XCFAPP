//
//  XCFCell.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/9.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "XCFCell.h"

@implementation XCFCell

+ (instancetype)cellWithTableView:(UITableView*)tableView
{
    NSString *className = NSStringFromClass([self class]);
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:className];
    if (cell == nil) {
        cell = [[[super class] alloc]initWithStyle:UITableViewCellStyleDefault
                                   reuseIdentifier:className];
    }
    return (XCFCell *)cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI
{
    [self.contentView setBackgroundColor:[UIColor whiteColor]];
    [self setSelectionStyle:UITableViewCellSelectionStyleNone];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // FIXME : 统一修改系统Cell的下边线
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull subView, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([subView isKindOfClass:NSClassFromString(@"_UITableViewCellSeparatorView")]) {
            subView.x = 0;
            subView.width = ScreenWidth;
            subView.backgroundColor = [XCFColor colorTableSeparatorColor];
        }
    }];
    
}

@end
