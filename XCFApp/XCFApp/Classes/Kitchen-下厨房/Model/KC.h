//
//  KC.h
//  XCFApp
//
//  Created by rkxt_ios on 15/12/01
//  Copyright (c) ST. All rights reserved.
//

#import <Foundation/Foundation.h>

@class KCContent,KCCursor,KCIssues,KCItems,KCContents,KCImage;

@interface KC : NSObject

@property (nonatomic, copy) NSString *status;

@property (nonatomic, strong) KCContent *content;

@end