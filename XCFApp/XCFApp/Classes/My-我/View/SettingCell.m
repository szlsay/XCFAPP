//
//  SettingCell.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/22.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "SettingCell.h"

@interface SettingCell()
@property (nonatomic, strong, nullable)UILabel *labelTitle; //
@property (nonatomic, strong, nullable)UIImageView *imageArrow; //
@end
@implementation SettingCell

- (void)setupUI
{
    [super setupUI];
    
    [self.contentView addSubview:self.labelTitle];
    [self.contentView addSubview:self.imageArrow];
}

- (void)setTitle:(NSString *)title
{
    _title = title;
    self.labelTitle.text = title;
}

- (UILabel *)labelTitle
{
    if (!_labelTitle) {
        _labelTitle = [UILabel labelWithFrame:CGRectMake(XCFMarginBig,
                                                         0,
                                                         ScreenWidth,
                                                         XCFControlSystemHeight)
                                         text:@""
                                         size:15
                                        color:[XCFColor colorTextNormal]];
    }
    return _labelTitle;
}

- (UIImageView *)imageArrow
{
    if (!_imageArrow) {
        CGFloat arrowW = 22;
        CGFloat arrowH = 22;
        CGFloat arrowX = ScreenWidth - arrowW - XCFMarginBig;
        CGFloat arrowY = (XCFControlSystemHeight - arrowH) / 2;
        _imageArrow = [[UIImageView alloc]initWithFrame:CGRectMake(arrowX,
                                                                   arrowY,
                                                                   arrowW,
                                                                   arrowH)];
        [_imageArrow setImage:[UIImage imageNamed:@"arrow"]];
    }
    return _imageArrow;
}

@end
