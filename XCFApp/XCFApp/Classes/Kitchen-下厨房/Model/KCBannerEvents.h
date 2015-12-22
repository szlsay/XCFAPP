//
//  KCBannerEvents.h
//  xiachufang
//
//  Created by rkxt_ios on 15/12/21
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCBannerCustomization,KCBannerDishes,KCBannerDishes;

@interface KCBannerEvents : NSObject

@property (nonatomic, strong) KCBannerCustomization *customization;

@property (nonatomic, assign) NSInteger n_dishes;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, strong) KCBannerDishes *dishes;

@property (nonatomic, copy) NSString *name;

@end