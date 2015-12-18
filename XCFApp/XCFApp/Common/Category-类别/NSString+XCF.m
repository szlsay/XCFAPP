//
//  NSString+XCF.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/18.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "NSString+XCF.h"

@implementation NSString (XCF)
- (CGSize)sizeWithFont:(CGFloat)fontSize
              maxWidth:(CGFloat)maxWidth
             maxHeight:(CGFloat)maxHeight
{
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    return [self boundingRectWithSize:CGSizeMake(maxWidth, maxHeight)
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}


- (CGSize)sizeWithAttributes:(NSDictionary<NSString *,id> *)attrs  maxSize:(CGSize)maxSize
{
    return [self boundingRectWithSize:maxSize
                              options:NSStringDrawingUsesLineFragmentOrigin
                           attributes:attrs
                              context:nil].size;
}

//判断字符串是否为空
+ (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    
    if ([string isEqualToString:@"(null)"] || [string isEqualToString:@"<null>"]) {
        return YES;
    }
    
    return NO;
}


+ (NSString *)stringWithRequestString:(NSString *)stringRequest
                        defaultString:(NSString *)defaultString
{
    if ([self isBlankString:stringRequest]) {
        return defaultString;
    }else {
        return stringRequest;
    }
}
@end
