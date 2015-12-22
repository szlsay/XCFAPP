//
//  KCBanner.h
//  xiachufang
//
//  Created by rkxt_ios on 15/12/21
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCBannerContent,KCBannerPopEvents,KCBannerEvents,KCBannerCustomization,KCBannerDishes,KCBannerDishes,KCBannerNavs;

@interface KCBanner : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) KCBannerContent *content;

@end