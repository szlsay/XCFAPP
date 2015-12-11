//
//  KCCursor.h
//  travelInter
//
//  Created by rkxt_ios on 15/12/10
//  Copyright (c) leowu. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface KCCursor : NSObject

@property (nonatomic, copy) NSString *prev;

@property (nonatomic, assign) BOOL has_prev;

@property (nonatomic, copy) NSString *next;

@property (nonatomic, assign) BOOL has_next;

@end