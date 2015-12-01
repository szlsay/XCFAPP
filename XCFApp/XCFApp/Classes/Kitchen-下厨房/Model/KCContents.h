//
//  KCContents.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/01
//  Copyright (c) ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCImage;

@interface KCContents : NSObject

@property (nonatomic, copy) NSString *title_1st;

@property (nonatomic, strong) KCImage *image;

@property (nonatomic, copy) NSString *title_2nd;

@end