//
//  KCIssues.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/01
//  Copyright (c) ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCItems,KCContents,KCImage;

@interface KCIssues : NSObject

@property (nonatomic, assign) NSInteger items_count;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray<KCItems *> *items;

@property (nonatomic, assign) NSInteger issue_id;

@property (nonatomic, strong) NSArray *today_events;

@property (nonatomic, copy) NSString *publish_date;

@end