//
//  NSString+XCF.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/18.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (XCF)
/**
 *  返回字符串所占用的尺寸
 *
 *  @param fontSize     字体大小
 *  @param maxWidth     最大宽度
 *  @param maxHeight    最大高度
 
 */
- (CGSize)sizeWithFont:(CGFloat)fontSize
              maxWidth:(CGFloat)maxWidth
             maxHeight:(CGFloat)maxHeight;

@end
