//
//  KCCell.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/9.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCCell.h"
#import "KCItems.h"
#import "KCContents.h"
#import "KCImage.h"
@interface KCCell()
@property (nonatomic, strong, nullable)UILabel *labelTitle1; //
@property (nonatomic, strong, nullable)UIImageView *pictureView; //
@property (nonatomic, strong, nullable)UILabel *labelTitle2; //
@end

@implementation KCCell

- (void)setupUI
{
    [super setupUI];
    
    [self.contentView addSubview:self.pictureView];
    [self.pictureView addSubview:self.labelTitle1];
    [self.pictureView addSubview:self.labelTitle2];

}


- (void)setItems:(KCItems *)items
{
    _items = items;
    
    
    CGFloat ratio = [items.contents.image.width doubleValue] / [items.contents.image.height doubleValue];
    CGFloat pictureH = ScreenWidth / ratio;
    self.pictureView.height = pictureH;
    self.pictureView.yy_imageURL = [NSURL URLWithString:items.contents.image.url];
    
    self.labelTitle1.text = items.contents.title_1st;
    self.labelTitle2.text = items.contents.title_2nd;
    
    self.labelTitle1.centerX = self.pictureView.centerX;
    self.labelTitle1.centerY = self.pictureView.centerY - XCFMargin;

    
    self.labelTitle2.centerX = self.pictureView.centerX;
    self.labelTitle2.centerY = self.pictureView.centerY + XCFMargin * 2;

}

- (UILabel *)labelTitle1
{
    if (!_labelTitle1) {
        _labelTitle1 = [UILabel labelWithFrame:CGRectMake(0,
                                                          0,
                                                          ScreenWidth-XCFControlSystemHeight,
                                                          XCFControlSystemHeight)
                                          text:@""
                                          size:19
                                         color:[UIColor whiteColor]
                                     alignment:NSTextAlignmentCenter
                                         lines:0];
    }
    return _labelTitle1;
}

- (UILabel *)labelTitle2
{
    if (!_labelTitle2) {
        _labelTitle2 = [UILabel labelWithFrame:CGRectMake(0,
                                                          0,
                                                          ScreenWidth-XCFControlSystemHeight,
                                                          XCFControlSystemHeight)
                                          text:@""
                                          size:15
                                         color:[UIColor whiteColor]
                                     alignment:NSTextAlignmentCenter
                                         lines:0];
    }
    return _labelTitle2;
}

- (UIImageView *)pictureView
{
    if (!_pictureView) {
        _pictureView = [[UIImageView alloc]initWithFrame:CGRectMake(0,
                                                                    0,
                                                                    ScreenWidth,
                                                                    0)];
    }
    return _pictureView;
}

@end
