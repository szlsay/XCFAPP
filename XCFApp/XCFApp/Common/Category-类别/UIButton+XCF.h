//
//  UIButton+XCF.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/4.
//  Copyright © 2015年 ST. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (XCF)
/**
 *  1.创建一个UIButton
 *
 *  @param frame           <#frame description#>
 *  @param backgroundColor <#backgroundColor description#>
 *  @param title           <#title description#>
 *  @param titleColor      <#titleColor description#>
 *  @param fontSize        <#fontSize description#>
 *
 *  @return <#return value description#>
 */
+ (UIButton *)buttonWithFrame:(CGRect)frame
              backgroundColor:(UIColor *)backgroundColor
                        title:(NSString *)title
                   titleColor:(UIColor *)titleColor
                     fontSize:(CGFloat)fontSize;
@end
