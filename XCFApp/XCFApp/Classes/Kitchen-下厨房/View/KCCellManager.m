//
//  KCCellManager.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/17.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "KCCellManager.h"
#import "KCItems.h"
#import "KCContents.h"
#import "KCImage.h"
@implementation KCCellManager

- (void)setItems:(KCItems *)items
{
    _items = items;
    
    // 1.控件的高度
    CGFloat ratio = [items.contents.image.width doubleValue] / [items.contents.image.height doubleValue];
    CGFloat pictureW = ScreenWidth;
    CGFloat pictureH = ScreenWidth / ratio;
    _framePicture = CGRectMake(0, 0, pictureW, pictureH);
    
    CGFloat titleX = XCFMarginBig;
    CGFloat titleY = CGRectGetMaxY(_framePicture);
    CGFloat titleW = ScreenWidth - titleX - 90;
    CGFloat titleH = XCFControlSystemHeight;
    _frameTitle = CGRectMake(titleX, titleY, titleW, titleH);
    
    
    CGFloat descX = XCFMarginBig;
    CGFloat descY = CGRectGetMaxY(_frameTitle);
    CGFloat descW = ScreenWidth - descX - 90;
    CGSize descSize = [items.contents.desc sizeWithFont:12
                                               maxWidth:descW
                                              maxHeight:ScreenHeight];
    CGFloat descH = descSize.height;
    _frameDesc = CGRectMake(descX, descY, descW, descH);
    
    CGFloat cookX = 0;
    CGFloat cookY = CGRectGetMaxY(_framePicture);
    CGFloat cookW = ScreenWidth - XCFMargin;
    CGFloat cookH = 75;
    _frameCook = CGRectMake(cookX, cookY, cookW, cookH);
    
    
    if (items.template == 1 || items.template == 5) {
        CGFloat titleX = XCFMarginBig;
        CGFloat titleY = CGRectGetMaxY(_framePicture) + XCFMargin;
        CGFloat titleW = ScreenWidth - 2 * titleX;
        CGSize titleSize = [items.contents.title sizeWithFont:17
                                                     maxWidth:titleW
                                                    maxHeight:ScreenHeight];
        CGFloat titleH = titleSize.height + XCFMarginSmall;
        _frameTitle = CGRectMake(titleX, titleY, titleW, titleH);
        
        
        CGFloat descX = XCFMarginBig;
        CGFloat descY = CGRectGetMaxY(_frameTitle);
        CGFloat descW = ScreenWidth - 2 * descX;
        CGSize descSize = [items.contents.desc sizeWithFont:12
                                                   maxWidth:descW
                                                  maxHeight:ScreenHeight];
        CGFloat descH = descSize.height + XCFMargin;
        _frameDesc = CGRectMake(descX, descY, descW, descH);
    }
    
    // 2.Cell的高度
    switch (items.template) {
        case 1:
            _heightCell = CGRectGetMaxY(_frameDesc) + XCFMargin;
            break;
        case 2:
            _heightCell = CGRectGetMaxY(_framePicture)+ 1;
            break;
        case 4:
            _heightCell = CGRectGetMaxY(_framePicture)+ 1;
            break;
        default:
            _heightCell = CGRectGetMaxY(_framePicture) + 1 + 75 ;
            break;
    }
    
}

@end
