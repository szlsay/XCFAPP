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

- (CGSize)sizeWithAttributes:(NSDictionary<NSString *,id> *)attrs
                     maxSize:(CGSize)maxSize;

/**
 *  1.如果请求的字符串不为空，返回本身，否则返回占位默认字符串
 *
 *  @param stringRequest <#stringRequest description#>
 *  @param defaultString <#defaultString description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)stringWithRequestString:(NSString *)stringRequest
                        defaultString:(NSString *)defaultString;
@end
