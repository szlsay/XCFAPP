//
//  KCItems.h
//  travelInter
//
//  Created by rkxt_ios on 15/12/10
//  Copyright (c) leowu. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCContents,KCImage;

@interface KCItems : NSObject

@property (nonatomic, assign) NSInteger ID;

@property (nonatomic, copy) NSString *column_name;

@property (nonatomic, copy) NSString *publish_time;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, assign) NSInteger template;

@property (nonatomic, strong) KCContents *contents;

@end