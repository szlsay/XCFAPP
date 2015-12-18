//
//  KCBannerModel.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/19
//  Copyright (c) ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCBannerContent,KCBannerAdInfo,KCBannerImage;

@interface KCBannerModel : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) KCBannerContent *content;

@end