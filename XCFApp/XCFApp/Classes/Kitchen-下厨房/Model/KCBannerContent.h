//
//  KCBannerContent.h
//  xiachufang
//
//  Created by rkxt_ios on 15/12/21
//  Copyright (c) __ORGANIZATIONNAME__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCBannerPopEvents,KCBannerEvents,KCBannerCustomization,KCBannerDishes,KCBannerDishes,KCBannerNavs;

@interface KCBannerContent : NSObject

@property (nonatomic, copy) NSString *pop_recipe_picurl;

@property (nonatomic, strong) NSArray<KCBannerNavs *> *navs;

@property (nonatomic, strong) KCBannerPopEvents *pop_events;

@end