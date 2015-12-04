//
//  XCFTextField.m
//  XCFApp
//
//  Created by rkxt_ios on 15/12/4.
//  Copyright © 2015年 ST. All rights reserved.
//

#import "XCFTextField.h"

@implementation XCFTextField

+ (XCFTextField *)textFieldWithFrame:(CGRect)frame
                         placeholder:(NSString *)placeholder
{
    XCFTextField *textField = [[XCFTextField alloc]initWithFrame:frame];
    [textField setPlaceholder:placeholder];
    [textField setBackgroundColor:[UIColor whiteColor]];
    [textField setFont:[UIFont systemFontOfSize:15]];
    [textField setTintColor:[XCFColor colorFlashLine]];
    [textField setLeftView:[[UIView alloc]initWithFrame:CGRectMake(0, 0, 20, 0)]];
    [textField setLeftViewMode:UITextFieldViewModeAlways];
    return textField;
}
@end
