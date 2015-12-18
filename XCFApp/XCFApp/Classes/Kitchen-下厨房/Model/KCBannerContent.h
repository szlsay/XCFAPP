//
//  KCBannerContent.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/19
//  Copyright (c) ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCBannerAdInfo,KCBannerImage;

@interface KCBannerContent : NSObject

@property (nonatomic, copy) NSString *click_tracking_url;

@property (nonatomic, copy) NSString *expose_tracking_url;

@property (nonatomic, strong) KCBannerAdInfo *ad_info;

@property (nonatomic, copy) NSString *start_time;

@property (nonatomic, assign) NSInteger ad_type;

@property (nonatomic, copy) NSString *end_time;

@end