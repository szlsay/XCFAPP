//
//  KCBannerAdInfo.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/19
//  Copyright (c) ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCBannerImage;

@interface KCBannerAdInfo : NSObject

@property (nonatomic, copy) NSString *url;

@property (nonatomic, strong) KCBannerImage *image;

@property (nonatomic, copy) NSString *pic_url;

@end