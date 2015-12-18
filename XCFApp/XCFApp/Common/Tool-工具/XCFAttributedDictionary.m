//
//  XCFAttributedDictionary.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/19.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "XCFAttributedDictionary.h"

@implementation XCFAttributedDictionary

+ (NSDictionary *)attributedDictionaryContent
{
    NSMutableParagraphStyle *styleParagraph=[NSMutableParagraphStyle new];
    styleParagraph.alignment     = NSTextAlignmentLeft;
    styleParagraph.lineSpacing   = 3;
    styleParagraph.lineBreakMode = NSLineBreakByTruncatingTail;
    
    NSDictionary * attributesDict=@{NSFontAttributeName:[UIFont systemFontOfSize:12],
                                    NSForegroundColorAttributeName:[XCFColor colorTextNormal],
                                    NSParagraphStyleAttributeName:styleParagraph};
    return attributesDict;

}

@end
