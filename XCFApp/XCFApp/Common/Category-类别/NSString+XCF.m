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

@end
