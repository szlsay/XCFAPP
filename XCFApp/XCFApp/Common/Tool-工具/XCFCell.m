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

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
